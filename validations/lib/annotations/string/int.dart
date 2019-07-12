part of annotations.string;

/// Checks that the annotated character sequence is a valid integer.
@immutable
class Int extends ValidatorAnnotation {
  const Int({
    String message,
    List<String> groups,
  }) : super(message, groups);
}
