part of annotations.number;

/// Checks if the element is positive or zero.
@immutable
class PositiveOrZero extends ValidatorAnnotation {
  const PositiveOrZero({
    message,
    groups,
  }) : super(message, groups);
}
