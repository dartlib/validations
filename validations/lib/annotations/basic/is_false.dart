part of annotations.basic;

/// The annotated element must be false or null
@immutable
@Constraint(validatedBy: IsFalseValidator)
class IsFalse extends ValidatorAnnotation {
  const IsFalse({
    String message,
    List<String> groups,
  }) : super(message, groups);
}
