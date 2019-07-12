part of annotations.comparison;

/// Checks whether the annotated value lies between (inclusive) the specified
/// minimum and maximum
@immutable
class Range extends ValidatorAnnotation {
  final double min;
  final double max;
  const Range({
    this.min,
    this.max,
    String message,
    List<String> groups,
  }) : super(message, groups);
}
