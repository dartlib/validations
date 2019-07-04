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

final annotationTypes =
    validator.fieldAnnotations.map((type) => TypeChecker.fromRuntime(type));

String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

class ModelParser {
  /// The [ClassElement] element of `GenValidator` spec.
  final ClassElement generatorClass;

  /// The model this validator handles.
  DartType model;

  /// Optional serializer to use
  final serializer;

  // Constant reader used to read fields from the [GenValidator]
  ConstantReader genValidatorReader;

  ModelParser({
    this.generatorClass,
    this.serializer,
  });

  String parse() {
    _findModel();

    final ClassElement modelClass = model.element;
    final modelClassName = modelClass.displayName;

    final classBuilder =
        Class(_buildValidatorClass(modelClassName, modelClass.fields));

    final emitter = DartEmitter();

    return DartFormatter().format('${classBuilder.accept(emitter)}');
  }

  _buildValidatorClass(String className, List<FieldElement> fields) {
    return (ClassBuilder classBuilder) {
      classBuilder.name = '\$_${generatorClass.displayName}';
      classBuilder.implements.add(
        refer('Validator<${className}>'),
      );
      classBuilder.abstract = true;

      final annotatedFields = _getAnnotatedFields(fields);

      classBuilder.fields.add(
        _buildValidatorsProperty(annotatedFields, classBuilder),
      );

      classBuilder.methods.add(
        _buildPropsMethod(annotatedFields, classBuilder),
      );
    };
  }

  List<FieldElement> _getAnnotatedFields(List<FieldElement> fields) {
    final annotatedFields = <FieldElement>[];

    for (FieldElement field in fields) {
      final hasValidatorAnnotations = annotationTypes
          .any((TypeChecker typeChecker) => typeChecker.hasAnnotationOf(field));

      if (hasValidatorAnnotations) {
        annotatedFields.add(field);
      }
    }

    return annotatedFields;
  }

  Method _buildPropsMethod(
      List<FieldElement> annotatedFields, ClassBuilder classBuilder) {
    final fieldNames =
        annotatedFields.fold({}, (properties, FieldElement field) {
      properties[literal(field.name)] = refer('instance.${field.name}');

      return properties;
    });

    final Code code = literalMap(fieldNames).returned.statement;

    return Method(
      (MethodBuilder builder) {
        builder
          ..name = 'props'
          ..body = code
          ..returns = refer('Map<String, dynamic>');
        builder.requiredParameters.add(
          Parameter(
            (p) => p
              ..name = 'instance'
              ..type = refer(model.name),
          ),
        );
      },
    );
  }

  Field _buildValidatorsProperty(
      List<FieldElement> fields, ClassBuilder classBuilder) {
    final map = <String, Expression>{};
    fields.forEach((FieldElement field) {
      final list = [];
      for (ElementAnnotation annotation in field.metadata) {
        /*
        final isValidatorAnnotation = annotationTypes.any(
            (TypeChecker typeChecker) =>
                typeChecker. (annotation.constantValue.type));
        */

        // if (isValidatorAnnotation) {

        final DartObjectImpl annotationImpl = annotation.computeConstantValue();
        final namedParams = <String, Expression>{};

        Code message;
        String messageMethod;
        List<Parameter> messageMethodParameters = [];

        final List<ParameterElement> parameters =
            (annotation.element as ConstructorElement).parameters;

        parameters.forEach((ParameterElement parameter) {
          if (parameter.displayName != 'message') {
            messageMethodParameters.add(
              Parameter((builder) {
                builder.name = parameter.name;
                builder.type = refer(parameter.type.name);
              }),
            );
          }
        });

        annotationImpl.fields.forEach((String k, DartObject v) {
          if (!v.isNull) {
            final value = _getValue(k, v);

            if (k == 'message') {
              messageMethod =
                  '${field.name}${capitalize(annotationImpl.type.displayName)}Message';
              message = value.code;
            } else {
              if (value != null) {
                namedParams[k] = value;
              }
            }
          }
        });

        if (messageMethod != null) {
          final validatedValue = Parameter((builder) {
            builder.name = 'validatedValue';
            builder.type = refer('Object');
          });

          classBuilder.methods.add(
            Method(
              (builder) {
                builder.static = true;
                builder.name = messageMethod;
                builder.body = message;
                builder.requiredParameters.addAll(messageMethodParameters);
                builder.requiredParameters.add(validatedValue);
              },
            ),
          );
        }

        final statement = refer('${annotationImpl.type.displayName}Validator')
            .newInstance([], namedParams);

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

    return Field(
      (FieldBuilder builder) {
        builder.name = 'validators';
        builder.type = refer('Map<String, List<ConstraintValidator>>');
        builder.modifier = FieldModifier.final$;
        builder.assignment = literalMap(map).code;
      },
    );
  }

  dynamic _getValue(String k, DartObject v) {
    final String type = v.type.name;
    if (type == 'bool') return literal(v.toBoolValue());
    if (type == 'String') {
      if (k == 'message') {
        return literalString(
          v.toStringValue(),
          raw: false,
        );
      }

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

    genValidatorReader = ConstantReader(meta);

    model = _getModelFromFirstGenericTypeArgument(generatorClass);
  }

  _getModelFromFirstGenericTypeArgument(ClassElement clazz) {
    final InterfaceType interface = clazz.allSupertypes.firstWhere(
      (InterfaceType i) => validatorType.isExactlyType(i),
    );

    final model = interface.typeArguments.first;

    if (model.isDynamic) throw Exception('Model cannot be dynamic!');

    return model;
  }
}
