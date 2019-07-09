import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/src/generated/constant.dart' show DartObjectImpl;
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:source_gen/source_gen.dart';
import 'package:validations/validations.dart' as validator;

const validatorType = TypeChecker.fromRuntime(validator.Validator);
const genValidatorType = TypeChecker.fromRuntime(validator.GenValidator);
const containerAnnotationType =
    TypeChecker.fromRuntime(validator.ContainerAnnotation);

final annotationTypes = validator.fieldAnnotations.map(
  (type) => TypeChecker.fromRuntime(type),
);

String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

bool useIntl = true;

class ModelParser {
  /// The [ClassElement] element of `GenValidator` spec.
  final ClassElement generatorClass;

  /// The model this validator handles.
  DartType model;

  LibraryReader library;

  ModelParser({
    this.generatorClass,
    this.library,
  });

  String parse() {
    _findModel();

    final modelClass = model.element as ClassElement;
    final modelClassName = modelClass.displayName;

    final classBuilder = Class(
      _buildValidatorClass(modelClassName, modelClass.fields),
    );

    final emitter = DartEmitter();

    return DartFormatter().format('${classBuilder.accept(emitter)}');
  }

  void Function(ClassBuilder) _buildValidatorClass(
      String className, List<FieldElement> fields) {
    return (ClassBuilder classBuilder) {
      classBuilder
        ..name = '\$_${generatorClass.displayName}'
        ..implements.add(refer('Validator<$className>'))
        ..abstract = true;

      final annotatedFields = _getAnnotatedFields(fields);

      classBuilder.methods.addAll([
        _buildGetConstraintValidators(annotatedFields, classBuilder),
        _buildPropsMethod(annotatedFields, classBuilder),
        ..._buildValidatorMethods(annotatedFields, classBuilder),
      ]);
    };
  }

  List<FieldElement> _getAnnotatedFields(List<FieldElement> fields) {
    final annotatedFields = <FieldElement>[];

    for (var field in fields) {
      final hasValidatorAnnotations = annotationTypes.any(
        (TypeChecker typeChecker) => typeChecker.hasAnnotationOf(field),
      );

      if (hasValidatorAnnotations) {
        annotatedFields.add(field);
      }
    }

    return annotatedFields;
  }

  List<Method> _buildValidatorMethods(
    List<FieldElement> annotatedFields,
    ClassBuilder classBuilder,
  ) {
    final methods = <Method>[];

    for (var field in annotatedFields) {
      final statement = refer('errorCheck').newInstance(
        [
          literalString(field.name),
          refer('value'),
        ],
      );

      methods.add(
        Method(
          (MethodBuilder builder) {
            builder
              ..name = 'validate${capitalize(field.name)}'
              ..body = statement.code
              ..returns = refer('String')
              ..requiredParameters.add(
                Parameter(
                  (parameter) => parameter
                    ..name = 'value'
                    ..type = refer('Object'),
                ),
              );
          },
        ),
      );
    }

    return methods;
  }

  Method _buildPropsMethod(
    List<FieldElement> annotatedFields,
    ClassBuilder classBuilder,
  ) {
    final fieldNames = annotatedFields.fold(
      <Expression, Expression>{},
      (Map<Expression, Expression> properties, FieldElement field) {
        properties[literal(field.name)] = refer('instance.${field.name}');

        return properties;
      },
    );

    final body = literalMap(fieldNames).returned.statement;

    return Method(
      (MethodBuilder builder) {
        builder
          ..name = 'props'
          ..body = body
          ..annotations.add(refer('override'))
          ..returns = refer('Map<String, dynamic>')
          ..requiredParameters.add(
            Parameter(
              (parameter) => parameter
                ..name = 'instance'
                ..type = refer(model.name),
            ),
          );
      },
    );
  }

  bool isValidatorAnnotation(ElementAnnotation annotation) {
    return annotationTypes.any(
      (typeChecker) => typeChecker.isExactlyType(annotation.constantValue.type),
    );
  }

  Method _buildGetConstraintValidators(
    List<FieldElement> fields,
    ClassBuilder classBuilder,
  ) {
    final map = <String, Expression>{};

    for (var field in fields) {
      final list = [];

      for (var annotation in field.metadata) {
        if (!isValidatorAnnotation(annotation)) continue;

        final annotationImpl =
            annotation.computeConstantValue() as DartObjectImpl;
        final namedParams = <String, Expression>{};

        String message;
        String messageMethod;
        final messageMethodParameters = <Parameter>[];

        final parameters = (annotation.element as ConstructorElement)
            .parameters
            .where((parameter) => parameter.displayName != 'message');

        for (var parameter in parameters) {
          messageMethodParameters.add(
            Parameter((builder) {
              builder
                ..name = parameter.name
                ..type = refer(parameter.type.name);
            }),
          );
        }

        annotationImpl.fields.forEach((String k, DartObject v) {
          if (!v.isNull) {
            if (k == 'message') {
              messageMethod =
                  '${field.name}${capitalize(annotationImpl.type.displayName)}Message';
              message = v.toStringValue();
            } else {
              final value = _getValue(k, v);

              if (value != null) {
                namedParams[k] = value;
              }
            }
          }
        });

        if (messageMethod != null) {
          classBuilder.methods.add(
            _buildMessageMethod(
              messageMethod,
              messageMethodParameters,
              message,
            ),
          );
        }

        final positionalArguments = <Expression>[];

        final isContainerAnnotation =
            containerAnnotationType.isAssignableFromType(annotationImpl.type);

        if (isContainerAnnotation) {
          final containerValidator =
              _getValidatorForModel(field.type.element as ClassElement);

          final str = refer(
              '${containerValidator.type.displayName}()..validationContext = validationContext,');

          positionalArguments.add(str);
        }

        final statement =
            refer('${annotationImpl.type.displayName}Validator').newInstance(
          positionalArguments,
          namedParams,
        );

        if (messageMethod != null) {
          list.add(
            Block.of(
              [
                statement.code,
                const Code('..'),
                refer('message').assign(refer(messageMethod)).code,
              ],
            ),
          );
        } else {
          list.add(statement);
        }
      }

      map[field.name] = literalList(list);
    }

    final body = literalMap(map).returned.statement;

    return Method((MethodBuilder builder) {
      builder
        ..name = 'getConstraintValidators'
        ..body = body
        ..annotations.add(refer('override'))
        ..returns = refer('Map<String, List<ConstraintValidator>>');
    });
  }

  Method _buildMessageMethod(
    String messageMethod,
    List<Parameter> messageMethodParameters,
    String message,
  ) {
    final validatedValue = Parameter(
      (builder) {
        builder
          ..name = 'validatedValue'
          ..type = refer('Object');
      },
    );

    Code body;

    if (useIntl) {
      final positionalArguments = <Expression>[literal(message)];
      final namedArguments = <String, Expression>{
        'name': literal(messageMethod),
        'args': literalList([
          ...messageMethodParameters.map(
            (Parameter parameter) => refer(parameter.name),
          ),
          refer('validatedValue'),
        ])
      };

      body = refer('Intl.message')
          .newInstance(
            positionalArguments,
            namedArguments,
          )
          .code;
    } else {
      body = Code(message);
    }

    return Method(
      (builder) {
        builder
          ..static = true
          ..name = messageMethod
          ..body = body
          ..returns = refer('String')
          ..requiredParameters.addAll(messageMethodParameters)
          ..requiredParameters.add(validatedValue);
      },
    );
  }

  Expression _getValue(String k, DartObject v) {
    final type = v.type.name;
    if (type == 'bool') return literal(v.toBoolValue());
    if (type == 'String') {
      return literalString(v.toStringValue());
    }
    if (type == 'double') return literal(v.toDoubleValue());
    if (type == 'int') return literal(v.toIntValue());

    return null;
  }

  void _findModel() {
    if (!validatorType.isAssignableFromType(generatorClass.type)) {
      throw Exception('Validators must implement Validator interface!');
    }

    final meta = genValidatorType.firstAnnotationOf(generatorClass);

    if (meta == null) {
      throw Exception(
        'GenValidator annotation not found for ${generatorClass.name}!',
      );
    }

    model = _getModelFromFirstGenericTypeArgument(generatorClass);
  }

  ClassElement _getValidatorForModel(ClassElement validatedModel) {
    final found = <ClassElement>[];
    for (var annotatedElement in library.annotatedWith(genValidatorType)) {
      final model = _getModelFromFirstGenericTypeArgument(
          annotatedElement.element as ClassElement);

      if (model.name == validatedModel.name) {
        found.add(annotatedElement.element as ClassElement);
      }
    }

    if (found.length == 1) return found.first;

    if (found.isEmpty) {
      throw Exception('Unable to find Validator for ${validatedModel.name}');
    }

    throw Exception('Multiple validators found for ${validatedModel.name}');
  }

  DartType _getModelFromFirstGenericTypeArgument(ClassElement clazz) {
    final interface =
        clazz.allSupertypes.firstWhere(validatorType.isExactlyType);

    final model = interface.typeArguments.first;

    if (model.isDynamic) throw Exception('Model cannot be dynamic!');

    return model;
  }
}
