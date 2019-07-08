part of annotations.basic;

/// Checks whether the annotated element is null
@immutable
class Null extends ValidatorAnnotation {
  const Null({
    message,
    groups,
  }) : super(message, groups);
}
