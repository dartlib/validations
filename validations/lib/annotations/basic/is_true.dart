part of annotations.basic;

/// The annotated element must be true
@immutable
class IsTrue extends ValidatorAnnotation {
  const IsTrue({
    String message,
    List<String> groups,
  }) : super(message, groups);
}
