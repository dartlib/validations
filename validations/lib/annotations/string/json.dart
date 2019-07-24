part of annotations.string;

/// Checks that the annotated string is valid JSON.
@immutable
@Constraint(validatedBy: JsonValidator)
@Target({ElementType.FIELD})
class Json extends ValidatorAnnotation {
  const Json({
    String message,
    List<String> groups,
  }) : super(message, groups);
}
