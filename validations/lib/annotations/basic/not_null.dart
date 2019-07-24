part of annotations.basic;

/// Checks whether the annotated element is not null
@immutable
@Constraint(validatedBy: NotNullValidator)
@Target({ElementType.FIELD})
class NotNull extends ValidatorAnnotation {
  const NotNull({
    String message,
    List<String> groups,
  }) : super(message, groups);
}
