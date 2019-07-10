part of annotations.string;

//// Checks that the annotated character sequence is in lowercase.
@immutable
class Lowercase extends ValidatorAnnotation {
  const Lowercase({
    message,
    groups,
  }) : super(message, groups);
}
