part of annotations.basic;

//// Checks whether the annotated element is null
@immutable
class Null extends ValidatorAnnotation {
  const Null({
    String message,
    List<String> groups,
  }) : super(message, groups);
}
