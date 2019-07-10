part of annotations.string;

//// Checks that the annotated character sequence is valid JSON.
@immutable
class Json extends ValidatorAnnotation {
  const Json({
    message,
    groups,
  }) : super(message, groups);
}
