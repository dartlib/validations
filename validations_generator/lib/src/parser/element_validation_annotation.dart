import 'annotation_parameter.dart';

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
