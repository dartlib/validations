part of annotations.comparison;

/// Checks whether the annotated value lies between (inclusive) the specified
/// minimum and maximum
@immutable
@Constraint(validatedBy: RangeValidator)
class Range extends ValidatorAnnotation {
  final num min;
  final num max;
  const Range({
    this.min,
    this.max,
    String message,
    List<String> groups,
  }) : super(message, groups);
}
