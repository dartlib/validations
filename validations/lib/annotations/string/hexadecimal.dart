part of annotations.string;

//// Checks that the annotated character sequence is a valid hexadecimal.
@immutable
class Hexadecimal extends ValidatorAnnotation {
  const Hexadecimal({
    message,
    groups,
  }) : super(message, groups);
}
