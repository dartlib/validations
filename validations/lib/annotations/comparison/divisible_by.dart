part of annotations.comparison;

/// Checks whether the annotated value is divisible by the specified value.
@immutable
class DivisibleBy extends ValidatorAnnotation {
  final Object value;
  const DivisibleBy({
    @required this.value,
    message,
    groups,
  }) : super(message, groups);
}
