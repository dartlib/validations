part of annotations.basic;

/// Checks whether the annotated element is not null nor empty
@immutable
@Constraint(validatedBy: NotEmptyValidator)
class NotEmpty extends ValidatorAnnotation {
  const NotEmpty({
    String message,
    List<String> groups,
  }) : super(message, groups);
}
