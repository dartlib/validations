import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/src/generated/constant.dart' show DartObjectImpl;
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:source_gen/source_gen.dart';
import 'package:validations/validations.dart' as validator;

final validatorType = TypeChecker.fromRuntime(validator.Validator);
final genValidatorType = TypeChecker.fromRuntime(validator.GenValidator);
final containerAnnotationType =
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

  /// Optional serializer to use
  final serializer;

  LibraryReader library;

  ModelParser({
    this.generatorClass,
    this.library,
    this.serializer,
  });

  String parse() {
    _findModel();

    final ClassElement modelClass = model.element;

    final modelClassName = modelClass.displayName;

    final classBuilder = Class(
      _buildValidatorClass(modelClassName, modelClass.fields),
    );

    final emitter = DartEmitter();

    return DartFormatter().format('${classBuilder.accept(emitter)}');
  }

  _buildValidatorClass(String className, List<FieldElement> fields) {
    return (ClassBuilder classBuilder) {
      classBuilder
        ..name = '\$_${generatorClass.displayName}'
        ..implements.add(refer('Validator<${className}>'))
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

    for (FieldElement field in fields) {
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
    final List<Method> methods = [];

    for (FieldElement field in annotatedFields) {
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
      {},
      (properties, FieldElement field) {
        properties[literal(field.name)] = refer('instance.${field.name}');

        return properties;
      },
    );

    final Code body = literalMap(fieldNames).returned.statement;

    return Method(
      (MethodBuilder builder) {
        builder
          ..name = 'props'
          ..body = body
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
    fields.forEach((FieldElement field) {
      final list = [];

      for (ElementAnnotation annotation in field.metadata) {
        if (!isValidatorAnnotation(annotation)) continue;

        final DartObjectImpl annotationImpl = annotation.computeConstantValue();
        final namedParams = <String, Expression>{};

        String message;
        String messageMethod;
        List<Parameter> messageMethodParameters = [];

        final List<ParameterElement> parameters =
            (annotation.element as ConstructorElement).parameters;

        parameters.forEach(
          (ParameterElement parameter) {
            if (parameter.displayName != 'message') {
              messageMethodParameters.add(
                Parameter((builder) {
                  builder
                    ..name = parameter.name
                    ..type = refer(parameter.type.name);
                }),
              );
            }
          },
        );

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

        final List<Expression> positionalArguments = [];

        final isContainerAnnotation =
            containerAnnotationType.isAssignableFromType(annotationImpl.type);

        if (isContainerAnnotation) {
          final containerValidator = _getValidatorForModel(field.type.element);

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
                Code('..'),
                refer('message').assign(refer(messageMethod)).code,
              ],
            ),
          );
        } else {
          list.add(statement);
        }
      }

      map[field.name] = literalList(list);
    });

    final Code body = literalMap(map).returned.statement;

    return Method((MethodBuilder builder) {
      builder
        ..name = 'getConstraintValidators'
        ..body = body
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
      final List<Expression> positionalArguments = [literal(message)];
      final Map<String, Expression> namedArguments = {
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
          ..requiredParameters.addAll(messageMethodParameters)
          ..requiredParameters.add(validatedValue);
      },
    );
  }

  dynamic _getValue(String k, DartObject v) {
    final String type = v.type.name;
    if (type == 'bool') return literal(v.toBoolValue());
    if (type == 'String') {
      return literalString(v.toStringValue());
    }
    if (type == 'double') return literal(v.toDoubleValue());
    if (type == 'int') return literal(v.toIntValue());
  }

  void _findModel() {
    if (!validatorType.isAssignableFromType(generatorClass.type)) {
      throw Exception('Validators must implement Validator interface!');
    }

    final DartObject meta = genValidatorType.firstAnnotationOf(generatorClass);

    if (meta == null) {
      throw Exception(
        'GenValidator annotation not found for ${generatorClass.name}!',
      );
    }

    model = _getModelFromFirstGenericTypeArgument(generatorClass);
  }

  ClassElement _getValidatorForModel(ClassElement validatedModel) {
    final List<ClassElement> found = [];
    for (AnnotatedElement annotatedElement
        in library.annotatedWith(genValidatorType)) {
      final model =
          _getModelFromFirstGenericTypeArgument(annotatedElement.element);

      if (model.name == validatedModel.name) {
        found.add(annotatedElement.element);
      }
    }

    if (found.length == 1) return found.first;

    if (found.isEmpty) {
      throw Exception('Unable to find Validator for ${validatedModel.name}');
    }

    throw Exception('Multiple validators found for ${validatedModel.name}');
  }

  DartType _getModelFromFirstGenericTypeArgument(ClassElement clazz) {
    final InterfaceType interface = clazz.allSupertypes.firstWhere(
      (InterfaceType i) => validatorType.isExactlyType(i),
    );

    final model = interface.typeArguments.first;

    if (model.isDynamic) throw Exception('Model cannot be dynamic!');

    return model;
  }
}
