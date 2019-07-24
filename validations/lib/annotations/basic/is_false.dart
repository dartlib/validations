part of annotations.basic;

/// The annotated element must be false or null
@immutable
@Constraint(validatedBy: IsFalseValidator)
@Target({ElementType.FIELD})
class IsFalse extends ValidatorAnnotation {
  const IsFalse({
    String message,
    List<String> groups,
  }) : super(message, groups);
}
