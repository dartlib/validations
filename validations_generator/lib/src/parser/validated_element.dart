import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:meta/meta.dart';
import 'package:source_gen/source_gen.dart';
import 'package:validations/annotation.dart';

import 'model.dart';

class AnnotationParameter {
  final String name;
  final String type;
  final Object value;
  final bool isNull;
  AnnotationParameter({
    this.name,
    this.type,
    this.value,
    this.isNull,
  });
}

/// Represent a validations annotation.
class ElementValidationAnnotation {
  // The ... type
  final String type;

  /// The message
  String message;

  /// The generated message method
  String messageMethod;

  /// Whether this is a container annotation.
  bool isContainerAnnotation = false;

  /// The list of parameters which is used
  /// for both the message method an construction of
  /// the constraint validator.
  List<AnnotationParameter> parameters = [];
  ElementValidationAnnotation({
    this.type,
  });
}

/// Represents an element which is annotated with a validation.
///
/// The element is either a [ElementType.FIELD] or [ElementType.CLASS].
class ValidatedElement {
  final String name;

  /// The class element
  /// Either the containing class for fields or the annotated class itself.
  final ClassElement element;

  /// The .... type
  final String type;

  final ElementType elementType;

  final Set<String> extraProperties = <String>{};

  /// A list of validation annotations.
  List<ElementValidationAnnotation> annotations = [];
  ValidatedElement({
    @required this.name,
    @required this.element,
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

      _parseAnnotation(
        annotation,
        count,
        ElementType.CLASS,
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

      _parseAnnotation(annotation, count, ElementType.FIELD);
    }
  }

  void _parseAnnotation(
      ElementAnnotation annotation, int count, ElementType type) {
    final constantValue = annotation.computeConstantValue();

    final reader = ConstantReader(constantValue);

    final parameters = (annotation.element as ConstructorElement).parameters;

    annotations.add(
      _createElementAnnotation(
        constantValue,
        reader,
        parameters,
        count,
        type,
      ),
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

    for (var parameter in parameters) {
      final param = reader.read(parameter.name);

      if (parameter.name == 'message' && !param.isNull) {
        final suffix = count > 1 ? count : '';

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

              extraProperties.add(value);
            }
          }
        }
      }
    }
  }
}
