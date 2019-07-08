part of annotations.number;

/// Checks if the element is negative or zero.
@immutable
class NegativeOrZero extends ValidatorAnnotation {
  const NegativeOrZero({
    message,
    groups,
  }) : super(message, groups);
}
