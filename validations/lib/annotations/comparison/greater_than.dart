part of annotations.comparison;

// Checks whether the annotated value is higher than the specified value.
@immutable
class GreaterThan extends ValidatorAnnotation {
  final num value;
  const GreaterThan({
    @required this.value,
    message,
    groups,
  }) : super(message, groups);
}
