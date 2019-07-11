part of annotations.comparison;

/// Checks whether the annotated value is not equal to another value.
@immutable
class NotEqualTo extends ValidatorAnnotation {
  final Object value;

  /// TODO: make propertyPath a proper object.
  final List<String> propertyPath;
  const NotEqualTo({
    @required this.value,
    this.propertyPath,
    String message,
    List<String> groups,
  }) : super(message, groups);
}
