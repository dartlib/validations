part of annotations.basic;

//// Checks whether the annotated element is empty or null
@immutable
class IsEmpty extends ValidatorAnnotation {
  const IsEmpty({
    message,
    groups,
  }) : super(message, groups);
}
