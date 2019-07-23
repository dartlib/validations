part of annotations.number;

/// Checks if the element is strictly positive. Zero values are considered
/// invalid.
@immutable
@Constraint(validatedBy: PositiveValidator)
@Target({ElementType.FIELD})
class Positive extends ValidatorAnnotation {
  const Positive({
    String message,
    List<String> groups,
  }) : super(message, groups);
}
