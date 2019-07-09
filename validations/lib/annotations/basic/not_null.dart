part of annotations.basic;

//// Checks whether the annotated element is not null
@immutable
class NotNull extends ValidatorAnnotation {
  const NotNull({
    message,
    groups,
  }) : super(message, groups);
}
