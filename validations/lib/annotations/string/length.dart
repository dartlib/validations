part of annotations.string;

//// Validates that the annotated character sequence is between
//// min and max included.
@immutable
class Length extends ValidatorAnnotation {
  const Length({
    message,
    groups,
  }) : super(message, groups);
}
