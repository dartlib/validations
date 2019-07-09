part of annotations.comparison;

/// Checks whether the annotated value is higher than or equal to the specified
/// minimum.
@immutable
class GreaterThanOrEqual extends ValidatorAnnotation {
  final num value;
  const GreaterThanOrEqual({
    @required this.value,
    message,
    groups,
  }) : super(message, groups);
}
