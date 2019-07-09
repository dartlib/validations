part of annotations.string;

/// Checks that the annotated character sequence is valid JSON.
@immutable
class Json {
  final String message;
  const Json({
    this.message,
  });
}
