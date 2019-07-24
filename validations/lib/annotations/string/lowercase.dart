part of annotations.string;

/// Checks that the annotated string is in lowercase.
@immutable
@Constraint(validatedBy: LowercaseValidator)
@Target({ElementType.FIELD})
class Lowercase extends ValidatorAnnotation {
  const Lowercase({
    String message,
    List<String> groups,
  }) : super(message, groups);
}
