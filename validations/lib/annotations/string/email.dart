part of annotations.string;

/// Checks whether the specified string is a valid email address.
@immutable
@Constraint(validatedBy: EmailValidator)
@Target({ElementType.FIELD})
class Email extends ValidatorAnnotation {
  const Email({
    String message,
    List<String> groups,
  }) : super(message, groups);
}
