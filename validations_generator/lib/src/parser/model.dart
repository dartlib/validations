import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:source_gen/source_gen.dart';
import 'package:validations/annotation.dart';
import 'package:validations/validations.dart' as validator;
import 'package:validations_generator/src/parser/validated_element.dart';

import 'annotation_parameter.dart';
import 'element_validation_annotation.dart';

const validatorType = TypeChecker.fromRuntime(validator.Validator);
const genValidatorType = TypeChecker.fromRuntime(validator.GenValidator);
const containerAnnotationType =
    TypeChecker.fromRuntime(validator.ContainerAnnotation);

final classAnnotationTypes =
    validator.classLevelAnnotations.where((type) => type is Type).map(
          (type) => type is Type ? TypeChecker.fromRuntime(type) : null,
        );
// TODO: simple annotations are now still ignored.
final annotationTypes =
    validator.fieldAnnotations.where((type) => type is Type).map(
          (type) => type is Type ? TypeChecker.fromRuntime(type) : null,
        );

String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
String deCapitalize(String s) => s[0].toLowerCase() + s.substring(1);

class ModelParser {
  /// The [ClassElement] element of `GenValidator` spec.
  final ClassElement generatorClass;

  /// The model this validator handles.
  DartType model;

  DartObject genValidatorAnnotation;

  LibraryReader library;

  /// Whether to use internationalization.
  final bool useIntl;

  ModelParser({
    this.generatorClass,
    this.useIntl = false,
    this.library,
  });

  String parse() {
    _findModel();

    final modelClass = model.element as ClassElement;

    final classBuilder = Class(
      _buildValidatorClass(modelClass),
    );

    final emitter = DartEmitter();

    return DartFormatter().format('${classBuilder.accept(emitter)}');
  }

  /// Builds the Validator class.
  ///
  /// Example:
  ///
  ///   abstract class _$TestDriverValidator implements Validator<Driver> {
  ///     ... // generatedMethods
  ///   }
  void Function(ClassBuilder) _buildValidatorClass(ClassElement modelClass) {
    final className = modelClass.displayName;
    final fields = modelClass.fields;

    return (ClassBuilder classBuilder) {
      classBuilder
        ..name = '_\$${generatorClass.displayName}'
        ..implements.add(refer('Validator<$className>'))
        ..abstract = true;

      final validatedClassElement = _getClassAnnotation(modelClass);

      var validatedElements = _getValidatedElements(fields);

      validatedElements = _getGenValidatorFields(validatedElements);

      if (validatedClassElement.extraProperties.isNotEmpty) {
        for (var field in validatedElements) {
          if (validatedClassElement.extraProperties.contains(field.name)) {
            field.usedAtClassLevel = true;
          }
        }
      }

      final annotatedElements = [
        ...validatedElements,
        validatedClassElement,
      ];

      final classValidator =
          _buildGetClassValidator(validatedClassElement, classBuilder);

      if (classValidator != null) {
        classBuilder.methods.add(classValidator);
      }

      classBuilder.methods.addAll([
        _buildGetFieldValidators(validatedElements, classBuilder),
        ..._buildValidatorMethods(validatedElements, classBuilder),
        _buildPropsMethod(annotatedElements, classBuilder),
      ]);
    };
  }

  /// Reads the `fields` parameter of GenValidator
  ///
  /// Any field specified in this map will override the annotations
  /// defined in the model (If any).
  ///
  /// Example:
  ///
  ///   @GenValidator(
  ///     fields: {
  ///       'price': [
  ///         DecimalMax(
  ///           value: '100.00',
  ///           message: r'Price must not be higher than $value',
  ///         ),
  ///       ],
  ///       'isRegistered': [
  ///         IsTrue(message: 'Car must be registered!'),
  ///       ],
  ///     },
  ///   )
  List<ValidatedElement> _getGenValidatorFields(
      List<ValidatedElement> annotatedFields) {
    final fields = genValidatorAnnotation.getField('fields').toMapValue();

    if (fields != null) {
      for (var name in fields.keys) {
        final annotations = fields[name].toListValue();

        final propertyField =
            (model.element as ClassElement).getField(name.toStringValue());

        final annotatedField = ValidatedElement(
          name: name.toStringValue(),
          element: propertyField.type.element as ClassElement,
          modelClass: model.element as ClassElement,
          elementType: ElementType.FIELD,
          type: propertyField.type.displayName,
        )..parseElementsProperties(annotations);

        annotatedFields
          ..retainWhere((field) => field.name != annotatedField.name)
          ..add(annotatedField);
      }
    }

    return annotatedFields;
  }

  /// Creates a ValidatedElement of type [ElementType.CLASS]
  ValidatedElement _getClassAnnotation(ClassElement clazz) {
    // TODO: actually check if this is a ElementType.CLASS annotation
    final element = ValidatedElement(
      name: clazz.name,
      element: clazz,
      elementType: ElementType.CLASS,
      modelClass: model.element as ClassElement,
      type: clazz.displayName,
    )..parseClassAnnotations(clazz);

    return element;
  }

  /// Filters a list of [FieldElement]s based on whether they are annotated
  /// with a validation annotation or not.
  ///
  /// If the field is annotated with any validation annotations it creates
  /// a [ValidatedElement] containing the necessary info for further processing.
  ///
  List<ValidatedElement> _getValidatedElements(List<FieldElement> fields) {
    final annotatedFields = <ValidatedElement>[];

    for (var field in fields) {
      final hasValidatorAnnotations = annotationTypes.any(
        (TypeChecker typeChecker) => typeChecker.hasAnnotationOf(field),
      );

      if (hasValidatorAnnotations) {
        // TODO: actually check if this is a ElementType.FIELD annotation
        // Note: FIELD will be the default and does not have to be specified.
        final annotatedField = ValidatedElement(
          name: field.name,
          element: field.type.element as ClassElement,
          elementType: ElementType.FIELD,
          modelClass: model.element as ClassElement,
          type: field.type.displayName,
        )..parseFieldAnnotations(field);

        annotatedFields.add(annotatedField);
      }
    }

    return annotatedFields;
  }

  /// Builds the validator methods
  ///
  /// Example:
  ///
  ///  String validateManufacturer(Object value) =>
  ///     errorCheck('manufacturer', value);
  ///  String validateDriver(Object value) => errorCheck('driver', value);
  ///  ...
  ///
  List<Method> _buildValidatorMethods(
    List<ValidatedElement> annotatedFields,
    ClassBuilder classBuilder,
  ) {
    final methods = <Method>[];

    for (var field in annotatedFields) {
      methods.add(_buildValidatorMethod(field));
    }

    return methods;
  }

  /// Builds a validatorMethod
  ///
  /// Depending on whether the property is affected by any class level
  /// validations. The generated method either calls `errorCheck` or
  /// `crossErrorCheck`.
  ///
  /// Whenever class level validations are involved the current state
  /// of the model must be supplied in order to enable cross error checking.
  ///
  /// Example:
  ///
  ///   String validateDriver(Object value) => errorCheck('driver', value);
  ///   String validateDriver(Object value, Object object) => crossErrorCheck(object, 'driver', value);
  ///
  Method _buildValidatorMethod(ValidatedElement field) {
    Expression statement;
    final parameters = <Parameter>[];

    if (field.usedAtClassLevel) {
      statement = refer('crossErrorCheck').newInstance(
        [
          refer('object'),
          literalString(field.name),
          refer('value'),
        ],
      );

      parameters.addAll([
        Parameter(
          (parameter) => parameter
            ..name = 'value'
            ..type = refer('Object'),
        ),
        Parameter(
          (parameter) => parameter
            ..name = 'object'
            ..type = refer(model.name),
        )
      ]);
    } else {
      statement = refer('errorCheck').newInstance(
        [
          literalString(field.name),
          refer('value'),
        ],
      );

      parameters.add(Parameter(
        (parameter) => parameter
          ..name = 'value'
          ..type = refer('Object'),
      ));
    }

    return Method((MethodBuilder builder) {
      builder
        ..name = 'validate${capitalize(field.name)}'
        ..body = statement.code
        ..returns = refer('String')
        ..requiredParameters.addAll(parameters);
    });
  }

  /// Build the props method.
  ///
  /// The props method returns a key value pair in order to get property values
  /// by name.
  ///
  /// example:
  ///
  ///  @override
  ///  PropertyMap<Car> props(Car instance) {
  ///    return PropertyMap<Car>({
  ///      'manufacturer': instance.manufacturer,
  ///      'driver': instance.driver,
  ///      'licensePlate': instance.licensePlate,
  ///      'seatCount': instance.seatCount,
  ///      'topSpeed': instance.topSpeed,
  ///      'price': instance.price,
  ///     'isRegistered': instance.isRegistered
  ///    });
  ///  }
  ///
  Method _buildPropsMethod(
    List<ValidatedElement> annotatedFields,
    ClassBuilder classBuilder,
  ) {
    final properties = <String>{};

    for (var field in annotatedFields) {
      if (field.elementType == ElementType.CLASS) {
        if (field.extraProperties.isNotEmpty) {
          for (var propertyName in field.extraProperties) {
            properties.add(propertyName);
          }
        }
      } else {
        properties.add(field.name);
      }
    }

    final fieldNames = properties.fold(
      <Expression, Expression>{},
      (Map<Expression, Expression> properties, String name) {
        properties[literal(name)] = refer('instance.$name');

        return properties;
      },
    );

    final body = refer('PropertyMap<${model.name}>')
        .newInstance(
          [
            literalMap(fieldNames),
          ],
        )
        .returned
        .statement;

    return Method(
      (MethodBuilder builder) {
        builder
          ..name = 'props'
          ..body = body
          ..annotations.add(refer('override'))
          ..returns = refer('PropertyMap<${model.name}>')
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

  /// Determine if the annotation is one of our validation annotations.
  bool isValidatorAnnotation(ElementAnnotation annotation) {
    return annotationTypes.any(
      (typeChecker) => typeChecker.isExactlyType(annotation.constantValue.type),
    );
  }

  /// Build the `getFieldValidators` method.
  ///
  /// Example:
  ///
  ///  @override
  ///  List<FieldValidator> getFieldValidators() {
  ///    return [
  ///      FieldValidator<String>(
  ///        name: 'manufacturer',
  ///        validators: [NotNullValidator()]
  ///      ),
  ///      FieldValidator<Driver>(
  ///        name: 'driver',
  ///        validators: [
  ///          ValidValidator(
  ///            TestDriverValidator()..validationContext = validationContext,
  ///          )..message = driverValidMessage
  ///        ]
  ///      ),
  ///      ...
  ///    ]
  ///  }
  ///

  List<Parameter> _getMessageMethodParameters(
      List<AnnotationParameter> parameters) {
    final messageMethodParameters = <Parameter>[];
    for (var parameter in parameters) {
      messageMethodParameters.add(
        Parameter((builder) {
          builder
            ..name = parameter.name
            ..type = refer(parameter.type);
        }),
      );
    }

    return messageMethodParameters;
  }

  Map<String, Expression> _getNamedParameters(
      List<AnnotationParameter> parameters) {
    final namedParams = <String, Expression>{};

    for (var parameter in parameters) {
      if (!parameter.isNull) {
        namedParams[parameter.name] = literal(parameter.value);
      }
    }

    return namedParams;
  }

  List<Expression> _buildPositionalArguments(
    ElementValidationAnnotation annotation,
    ClassElement classElement,
  ) {
    final positionalArguments = <Expression>[];

    if (annotation.isContainerAnnotation) {
      final containerValidator = _getValidatorForModel(classElement);

      final str = refer(
          '${containerValidator.type.displayName}()..validationContext = validationContext,');

      positionalArguments.add(str);
    }

    return positionalArguments;
  }

  List _buildFieldValidator(ValidatedElement field, ClassBuilder classBuilder) {
    final list = [];

    for (var annotation in field.annotations) {
      final messageMethodParameters =
          _getMessageMethodParameters(annotation.parameters);
      final namedParams = _getNamedParameters(annotation.parameters);

      if (annotation.messageMethod != null) {
        classBuilder.methods.add(
          _buildMessageMethod(
            annotation.messageMethod,
            messageMethodParameters,
            annotation.message,
          ),
        );
      }

      final positionalArguments =
          _buildPositionalArguments(annotation, field.element);

      final statement = refer('${annotation.type}Validator').newInstance(
        positionalArguments,
        namedParams,
      );

      final block = <Code>[
        statement.code,
      ];

      if (field.extraProperties.isNotEmpty) {
        block.addAll(
          [
            const Code('..'),
            refer('affectedFields')
                .assign(
                  literal(
                    field.extraProperties.toList(),
                  ),
                )
                .code,
          ],
        );
      }

      if (annotation.messageMethod != null) {
        block.addAll(
          [
            const Code('..'),
            refer('message').assign(refer(annotation.messageMethod)).code,
          ],
        );
      }

      list.add(Block.of(block));
    }

    return list;
  }

  Method _buildGetClassValidator(
    ValidatedElement field,
    ClassBuilder classBuilder,
  ) {
    // field validator should know how to generate more message setters.
    final list = _buildFieldValidator(field, classBuilder);

    if (list.isNotEmpty) {
      final validators = literalList(list);

      final classValidator = refer('ClassValidator').newInstance(
        [],
        {
          'validators': validators,
        },
        [refer(field.type)],
      );

      final body = classValidator.returned.statement;

      return Method((MethodBuilder builder) {
        builder
          ..name = 'getClassValidator'
          ..body = body
          ..annotations.add(refer('override'))
          ..returns = refer('ClassValidator');
      });
    }

    return null;
  }

  Method _buildGetFieldValidators(
    List<ValidatedElement> fields,
    ClassBuilder classBuilder,
  ) {
    final fieldValidators = [];

    for (var field in fields) {
      final list = _buildFieldValidator(field, classBuilder);

      if (field.elementType == ElementType.FIELD) {
        final namedParameters = {
          'name': literalString(field.name),
          'validators': literalList(list),
        };

        if (field.usedAtClassLevel) {
          namedParameters['validateClass'] = literalBool(true);
        }

        fieldValidators.add(
          refer('FieldValidator').newInstance(
            [],
            namedParameters,
            // [refer(field.type.name)],
            [refer(field.type)],
          ),
        );
      } else {
        throw Exception('Field is not a ElementType.FIELD');
      }
    }

    final body = literalList(fieldValidators).returned.statement;

    return Method((MethodBuilder builder) {
      builder
        ..name = 'getFieldValidators'
        ..body = body
        ..annotations.add(refer('override'))
        ..returns = refer('List<FieldValidator>');
    });
  }

  /// Builds the `messageMethod`
  ///
  /// The generated output depends on whether `useIntl` is set.
  ///
  /// Example (without intl):
  ///
  ///  static String topSpeedMaxMessage(num, value, Object validatedValue) {
  ///    return 'The top speed $validatedValue is higher than $value';
  ///  }
  ///
  /// Example (with intl enabled):
  ///
  ///   static String topSpeedMaxMessage(num value, Object validatedValue) =>
  ///     Intl.message(
  ///       'The top speed $validatedValue is higher than $value',
  ///       name: 'topSpeedMaxMessage',
  ///       args: [value, validatedValue]
  ///     );
  ///
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
      body = _buildIntlMethod(
        message,
        messageMethod,
        messageMethodParameters,
      );
    } else {
      body = literalString(message).returned.statement;
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

  /// Build the Intl message method.
  ///
  /// Example:
  ///
  ///   static String topSpeedMaxMessage(num value, Object validatedValue) =>
  ///     Intl.message(
  ///       'The top speed $validatedValue is higher than $value',
  ///       name: 'topSpeedMaxMessage',
  ///       args: [value, validatedValue]
  ///     );
  ///
  Code _buildIntlMethod(
    String message,
    String messageMethod,
    List<Parameter> messageMethodParameters,
  ) {
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

    return refer('Intl.message')
        .newInstance(
          positionalArguments,
          namedArguments,
        )
        .code;
  }

  /// Find the model associated with this validator.
  void _findModel() {
    if (!validatorType.isAssignableFromType(generatorClass.type)) {
      throw Exception('Validators must implement Validator interface!');
    }

    genValidatorAnnotation = genValidatorType.firstAnnotationOf(generatorClass);

    if (genValidatorAnnotation == null) {
      throw Exception(
        'GenValidator annotation not found for ${generatorClass.name}!',
      );
    }

    model = _getModelFromFirstGenericTypeArgument(generatorClass);
  }

  /// Get the validator associated with this model.
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

  /// Looks at the first generic type argument of the validator class.
  /// To determine what model it is trying to validate.
  DartType _getModelFromFirstGenericTypeArgument(ClassElement clazz) {
    final interface =
        clazz.allSupertypes.firstWhere(validatorType.isExactlyType);

    final model = interface.typeArguments.first;

    if (model.isDynamic) throw Exception('Model cannot be dynamic!');

    return model;
  }
}
