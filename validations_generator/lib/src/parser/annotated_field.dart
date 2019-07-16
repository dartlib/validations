import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';

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

class FieldAnnotation {
  final String type;
  String message;
  String messageMethod;
  bool isContainerAnnotation = false;
  List<AnnotationParameter> parameters = [];
  FieldAnnotation({
    this.type,
  });
}

class AnnotatedField {
  final String name;
  final ClassElement element;
  final String type;
  List<FieldAnnotation> annotations = [];
  AnnotatedField({
    this.name,
    this.element,
    this.type,
  })  : assert(name != null),
        assert(type != null),
        assert(type != 'null');

  bool isValidatorAnnotation(ElementAnnotation annotation) {
    return annotationTypes.any(
      (typeChecker) => typeChecker.isExactlyType(annotation.constantValue.type),
    );
  }

  void parseFieldsProperties(List<DartObject> annotations) {
    for (var annotation in annotations) {
      this.annotations.add(parseField(annotation));
    }
  }

  FieldAnnotation parseField(DartObject constantValue) {
    final annotationElement = constantValue.type.element as ClassElement;

    final constructor = annotationElement.getNamedConstructor('');

    final reader = ConstantReader(constantValue);

    final parameters = constructor.parameters;

    return _createFieldAnnotation(
      constantValue,
      reader,
      parameters,
    );
  }

  void parseAnnotations(FieldElement field) {
    for (var annotation in field.metadata) {
      if (!isValidatorAnnotation(annotation)) continue;

      final constantValue = annotation.computeConstantValue();

      final reader = ConstantReader(constantValue);

      final parameters = (annotation.element as ConstructorElement).parameters;

      annotations.add(
        _createFieldAnnotation(
          constantValue,
          reader,
          parameters,
        ),
      );
    }
  }

  FieldAnnotation _createFieldAnnotation(
    DartObject constantValue,
    ConstantReader reader,
    List<ParameterElement> parameters,
  ) {
    final fieldAnnotation = FieldAnnotation(
      type: constantValue.type.displayName,
    )..isContainerAnnotation =
        containerAnnotationType.isAssignableFromType(constantValue.type);

    for (var parameter in parameters) {
      final param = reader.read(parameter.name);

      if (parameter.name == 'message' && !param.isNull) {
        fieldAnnotation
          ..messageMethod = '$name${capitalize(fieldAnnotation.type)}Message'
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

    return fieldAnnotation;
  }
}
