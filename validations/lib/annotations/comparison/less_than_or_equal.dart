part of annotations.comparison;

/// Checks whether the annotated value is less than or equal to the specified
/// maximum.
@immutable
class LessThanOrEqual extends ValidatorAnnotation {
  final num value;
  const LessThanOrEqual({
    @required this.value,
    String message,
    List<String> groups,
  }) : super(message, groups);
}
