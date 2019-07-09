part of annotations.basic;

//// The annotated element must be [false] or [null]
@immutable
class IsFalse extends ValidatorAnnotation {
  const IsFalse({
    message,
    groups,
  }) : super(message, groups);
}
