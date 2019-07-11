part of annotations.basic;

//// Checks whether the annotated element is not null
@immutable
class NotNull extends ValidatorAnnotation {
  const NotNull({
    String message,
    List<String> groups,
  }) : super(message, groups);
}
