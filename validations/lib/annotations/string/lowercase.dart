part of annotations.string;

/// Checks that the annotated character sequence is in lowercase.
@immutable
class Lowercase extends ValidatorAnnotation {
  const Lowercase({
    String message,
    List<String> groups,
  }) : super(message, groups);
}
