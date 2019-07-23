part of annotations.string;

/// Checks that the annotated string is a valid number.
@immutable
@Constraint(validatedBy: NumericValidator)
class Numeric extends ValidatorAnnotation {
  const Numeric({
    String message,
    List<String> groups,
  }) : super(message, groups);
}
