part of annotations.comparison;

/// Checks whether the annotated value is equal to another value.
@immutable
class EqualTo extends ValidatorAnnotation {
  final Object value;

  /// TODO: make propertyPath a proper object.
  final List<String> propertyPath;
  const EqualTo({
    @required this.value,
    this.propertyPath,
    String message,
    List<String> groups,
  }) : super(message, groups);
}
