part of annotations.number;

/// Checks if the element is negative or zero.
@immutable
@Constraint(validatedBy: NegativeOrZeroValidator)
@Target({ElementType.FIELD})
class NegativeOrZero extends ValidatorAnnotation {
  const NegativeOrZero({
    String message,
    List<String> groups,
  }) : super(message, groups);
}
