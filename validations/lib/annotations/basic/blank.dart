part of annotations.basic;

/// Checks that the annotated character sequence is null or the
/// length is not greater than 0.
@immutable
class Blank extends ValidatorAnnotation {
  const Blank({
    String message,
    List<String> groups,
  }) : super(message, groups);
}
