part of annotations.string;

/// Checks that the annotated string is valid JSON.
@immutable
class Json extends ValidatorAnnotation {
  const Json({
    String message,
    List<String> groups,
  }) : super(message, groups);
}
