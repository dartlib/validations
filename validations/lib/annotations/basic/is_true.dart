part of annotations.basic;

/// The annotated element must be [true]
@immutable
class IsTrue extends ValidatorAnnotation {
  const IsTrue({
    message,
    groups,
  }) : super(message, groups);
}
