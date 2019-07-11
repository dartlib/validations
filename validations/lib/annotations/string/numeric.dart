part of annotations.string;

//// Checks that the annotated character sequence is a valid number.
@immutable
class Numeric extends ValidatorAnnotation {
  const Numeric({
    String message,
    List<String> groups,
  }) : super(message, groups);
}
