part of annotations.comparison;

/// Checks whether the annotated value is [identical] to another value.
@immutable
class IdenticalTo extends ValidatorAnnotation {
  final Object value;

  /// TODO: make propertyPath a proper object.
  final List<String> propertyPath;
  const IdenticalTo({
    @required this.value,
    this.propertyPath,
    String message,
    List<String> groups,
  }) : super(message, groups);
}
