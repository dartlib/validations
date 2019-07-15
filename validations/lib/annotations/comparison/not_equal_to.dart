part of annotations.comparison;

/// Checks whether the annotated value is not equal to another value.
@immutable
class NotEqualTo extends ValidatorAnnotation {
  final Object value;

  const NotEqualTo({
    @required this.value,
    String message,
    List<String> groups,
  }) : super(message, groups);
}
