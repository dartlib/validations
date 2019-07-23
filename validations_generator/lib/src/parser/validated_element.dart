import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:meta/meta.dart';
import 'package:source_gen/source_gen.dart';
import 'package:validations/annotation.dart';

import 'annotation_parameter.dart';
import 'element_validation_annotation.dart';
import 'model.dart';

/// Represents an element which is annotated with a validation.
///
/// The element is either a [ElementType.FIELD] or [ElementType.CLASS].
class ValidatedElement {
  final String name;

  /// The class element
  /// Either the containing class for fields or the annotated class itself.
  final ClassElement element;

  /// Used for field elements to get access to the modelClass
  final ClassElement modelClass;

  /// The .... type
  final String type;

  final ElementType elementType;

  final Set<String> extraProperties = <String>{};

  // A Map of error messages in order to generate methods for these.
  // Key is the relevant property, value is the message itself.
  final errorMessages = <String, String>{};

  /// whether this field is (also) referenced at the class level.
  bool usedAtClassLevel = false;

  /// A list of validation annotations.
  List<ElementValidationAnnotation> annotations = [];
  ValidatedElement({
    @required this.name,
    @required this.element,
    @required this.modelClass,
    @required this.elementType,
    @required this.type,
  })  : assert(name != null),
        assert(type != null),
        assert(elementType != null),
        assert(type != 'null');

  /// Checks whether the annotation is a validator annotation.
  ///
  bool isValidatorAnnotation(ElementAnnotation annotation) {
    return annotationTypes.any(
      (typeChecker) => typeChecker.isExactlyType(annotation.constantValue.type),
    );
  }

  /// Iterates all annotations and parses them into [ElementValidationAnnotation]s.
  void parseElementsProperties(List<DartObject> annotations) {
    final seen = [];

    for (var annotation in annotations) {
      seen.add(name);

      final count = seen.where((value) => value == name).length;

      this.annotations.add(parseElementProperty(annotation, count));
    }
  }

  ElementValidationAnnotation parseElementProperty(
      DartObject constantValue, int count) {
    final annotationElement = constantValue.type.element as ClassElement;

    final constructor = annotationElement.getNamedConstructor('');

    final reader = ConstantReader(constantValue);

    final parameters = constructor.parameters;

    return _createElementAnnotation(
      constantValue,
      reader,
      parameters,
      count,
      ElementType.FIELD,
    );
  }

  void parseClassAnnotations(ClassElement field) {
    final seen = [];

    for (var annotation in field.metadata) {
      // if (!isValidatorAnnotation(annotation)) continue;
      final name = annotation.constantValue.type.name;

      seen.add(name);

      final count = seen.where((value) => value == name).length;

      annotations.add(
        _parseAnnotation(
          annotation,
          count,
          ElementType.CLASS,
        ),
      );
    }
  }

  /// Iterates the metadata (ElementAnnotations) of a ClassElement or FieldElement.
  void parseFieldAnnotations(FieldElement field) {
    final seen = [];

    for (var annotation in field.metadata) {
      if (!isValidatorAnnotation(annotation)) continue;

      final name = annotation.constantValue.type.name;

      seen.add(name);

      final count = seen.where((value) => value == name).length;

      annotations.add(
        _parseAnnotation(
          annotation,
          count,
          ElementType.FIELD,
        ),
      );
    }
  }

  ElementValidationAnnotation _parseAnnotation(
    ElementAnnotation annotation,
    int count,
    ElementType type,
  ) {
    final constantValue = annotation.computeConstantValue();

    final reader = ConstantReader(constantValue);

    final parameters = (annotation.element as ConstructorElement).parameters;

    return _createElementAnnotation(
      constantValue,
      reader,
      parameters,
      count,
      type,
    );
  }

  ElementValidationAnnotation _createElementAnnotation(
    DartObject constantValue,
    ConstantReader reader,
    List<ParameterElement> parameters,
    int count,
    ElementType elementType,
  ) {
    final fieldAnnotation = ElementValidationAnnotation(
      type: constantValue.type.displayName,
    )..isContainerAnnotation =
        containerAnnotationType.isAssignableFromType(constantValue.type);

    final annotationClass = constantValue.type.element as ClassElement;

    for (var parameter in parameters) {
      final param = reader.read(parameter.name);

      // detect here if it's annotated with @errorMessage.
      final hasErrorMessageAnnotation = hasAnnotation(
          annotationClass.getField(parameter.name), 'errorMessage');

      if (parameter.name == 'message' && !param.isNull) {
        final suffix = count > 1 ? count : '';

        // should push the cascades here.
        //  I can't add the other message methods like this.
        fieldAnnotation
          ..messageMethod =
              '${deCapitalize(name)}${capitalize(fieldAnnotation.type)}Message$suffix'
          ..message = param.stringValue;
      } else if (parameter.name != 'groups') {
        fieldAnnotation.parameters.add(
          AnnotationParameter(
            name: parameter.name,
            type: parameter.type.displayName,
            value: param.literalValue,
            isNull: param.isNull,
          ),
        );
      }
    }

    _parseClassAnnotationDirectives();

    return fieldAnnotation;
  }

  ElementAnnotation getAnnotation(FieldElement field, String name) {
    return field.metadata.firstWhere(
      (annotation) => annotation.element.name == name,
      orElse: () => null,
    );
  }

  bool hasAnnotation(FieldElement field, String name) {
    return getAnnotation(field, name) != null;
  }

  /// Does an extra sweep to parse annotations specific to
  /// the annotation classes themselves.
  ///
  /// Currently it only processes @property.
  ///
  /// Which directs the parser to do some field checks.
  ///
  /// TODO: integrate this a bit better instead of parsing it separately.
  void _parseClassAnnotationDirectives() {
    if (elementType == ElementType.CLASS) {
      final classAnnotations = element.metadata;

      for (var classAnnotation in classAnnotations) {
        classAnnotation.computeConstantValue();

        final classElement =
            classAnnotation.constantValue.type.element as ClassElement;

        final trackedProperties = <String>{};
        for (var field in classElement.fields) {
          for (var fieldAnnotation in field.metadata) {
            final name = fieldAnnotation.element.name;

            if (name == 'property') {
              final value = classAnnotation.constantValue
                  .getField(field.name)
                  .toStringValue();

              final classField = element.getField(value);

              if (classField == null) {
                throw Exception(
                    '@property: `${classAnnotation.constantValue.type.name}.${field.name}` refers to a field which does not exist: ${element.name}.$value');
              }

              // if one of the mentioned value is us.
              // *then* add all extraProperties.

              trackedProperties.add(value);
            }

            if (name == 'errorMessage') {
              final message = classAnnotation.constantValue
                  .getField(field.name)
                  .toStringValue();

              // field.name: e.g. matchFieldMessage
              // message: the message
              final fieldName = field.name.replaceRange(
                field.name.indexOf('Message'),
                field.name.length,
                '',
              );

              errorMessages[fieldName] = message;
            }
          }
        }

        // if (trackedProperties.contains(name)) {
        extraProperties.addAll(trackedProperties);
        // }
      }
    }
  }
}
