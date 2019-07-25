import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:meta/meta.dart';
import 'package:source_gen/source_gen.dart';
import 'package:validations/annotation.dart';

import 'annotation_parameter.dart';
import 'element_validation_annotation.dart';
import 'helpers/index.dart';
import 'message_method.dart';
import 'model.dart';

const containerAnnotationType = TypeChecker.fromRuntime(ContainerAnnotation);

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

  /// whether this field is (also) referenced at the class level.
  bool usedAtClassLevel = false;

  LibraryReader library;

  /// A list of validation annotations.
  List<ElementValidationAnnotation> annotations = [];

  ValidatedElement({
    @required this.name,
    @required this.element,
    @required this.modelClass,
    @required this.elementType,
    @required this.type,
    @required this.library,
  })  : assert(name != null),
        assert(type != null),
        assert(elementType != null),
        assert(type != 'null');

  /// Iterates all annotations and parses them into [ElementValidationAnnotation]s.
  void parseElementsProperties(List<DartObject> annotations) {
    for (var annotation in annotations) {
      this.annotations.add(parseElementProperty(annotation));
    }
  }

  ElementValidationAnnotation parseElementProperty(DartObject constantValue) {
    final annotationElement = constantValue.type.element as ClassElement;

    final constructor = annotationElement.getNamedConstructor('');

    final reader = ConstantReader(constantValue);

    final parameters = constructor.parameters;

    return _createElementAnnotation(
      constantValue,
      reader,
      parameters,
      ElementType.FIELD,
    );
  }

  void parseClassAnnotations(ClassElement field) {
    for (var annotation in field.metadata) {
      if (!isValidatorAnnotation(annotation, ElementType.CLASS)) continue;

      annotations.add(
        _parseAnnotation(
          annotation,
          ElementType.CLASS,
        ),
      );
    }
  }

  /// Iterates the metadata (ElementAnnotations) of a ClassElement or FieldElement.
  void parseFieldAnnotations(FieldElement field) {
    for (var annotation in field.metadata) {
      if (!isValidatorAnnotation(annotation, ElementType.FIELD)) continue;

      annotations.add(
        _parseAnnotation(
          annotation,
          ElementType.FIELD,
        ),
      );
    }
  }

  ElementValidationAnnotation _parseAnnotation(
    ElementAnnotation annotation,
    ElementType type,
  ) {
    final constantValue = annotation.computeConstantValue();

    final reader = ConstantReader(constantValue);

    final parameters = (annotation.element as ConstructorElement).parameters;

    return _createElementAnnotation(
      constantValue,
      reader,
      parameters,
      type,
    );
  }

  ElementValidationAnnotation _createElementAnnotation(
    DartObject constantValue,
    ConstantReader reader,
    List<ParameterElement> parameters,
    ElementType elementType,
  ) {
    final fieldAnnotation = ElementValidationAnnotation(
      type: constantValue.type.displayName,
    )..isContainerAnnotation =
        containerAnnotationType.isAssignableFromType(constantValue.type);

    final annotationClass = constantValue.type.element as ClassElement;

    final validatedBy = _getValidatedBy(annotationClass);

    for (var parameter in parameters) {
      final param = reader.read(parameter.name);

      final field = annotationClass.getField(parameter.name);

      final hasErrorMessageAnnotation = hasAnnotation(field, 'errorMessage');

      final hasPropertyAnnotation = hasAnnotation(field, 'property');

      if (hasPropertyAnnotation) {
        final value = constantValue.getField(field.name).toStringValue();

        final classField = element.getField(value);

        if (classField == null) {
          throw Exception(
            '@property: `${constantValue.type.name}.${field.name}` refers to a field which does not exist: ${element.name}.$value',
          );
        }

        fieldAnnotation.relatedFields.add(value);
      }

      if (hasErrorMessageAnnotation && !param.isNull) {
        fieldAnnotation.messageMethods.add(
          MessageMethod(
            name: parameter.name,
            validator: validatedBy,
            methodName:
                '${deCapitalize(name)}${capitalize(fieldAnnotation.type)}${capitalize(parameter.name)}',
            message: param.stringValue,
          ),
        );
      } else if (parameter.name == 'message' && !param.isNull) {
        fieldAnnotation.messageMethods.add(
          MessageMethod(
            name: 'message',
            validator: validatedBy,
            methodName:
                '${deCapitalize(name)}${capitalize(fieldAnnotation.type)}Message',
            message: param.stringValue,
          ),
        );
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

    return fieldAnnotation;
  }

  Set<String> getAllRelatedFields() {
    return annotations.fold(
      <String>{},
      (Set<String> relatedFields, ElementValidationAnnotation annotation) =>
          relatedFields..addAll(annotation.relatedFields),
    );
  }

  ClassElement _getValidatedBy(ClassElement annotationClass) {
    final constraintAnnotation = getAnnotation(annotationClass, 'Constraint');

    if (constraintAnnotation == null) {
      throw Exception(
        'Validator Annotation `${annotationClass.name}` should be annotated with a @Constraint annotation.',
      );
    }

    final validatedBy =
        constraintAnnotation.constantValue.getField('validatedBy');

    if (validatedBy == null) {
      throw Exception(
        '@Constraint annotation of ${annotationClass.name} did not specify validatedBy',
      );
    }

    return validatedBy.toTypeValue().element as ClassElement;
  }
}
