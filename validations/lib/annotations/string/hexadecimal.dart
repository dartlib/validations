part of annotations.string;

/// Checks that the annotated character sequence is a valid hexadecimal.
@immutable
class Hexadecimal extends ValidatorAnnotation {
  const Hexadecimal({
    String message,
    List<String> groups,
  }) : super(message, groups);
}
