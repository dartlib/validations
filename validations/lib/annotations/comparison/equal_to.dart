part of annotations.comparison;

/// Checks whether the annotated value is equal to another value.
@immutable
class EqualTo extends ValidatorAnnotation {
  final Object value;

  const EqualTo({
    @required this.value,
    String message,
    List<String> groups,
  }) : super(message, groups);
}
