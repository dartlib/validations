part of annotations.string;

//// Checks that the annotated character sequence is a valid number.
@immutable
class Numeric extends ValidatorAnnotation {
  const Numeric({
    message,
    groups,
  }) : super(message, groups);
}
