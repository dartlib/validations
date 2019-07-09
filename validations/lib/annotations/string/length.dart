part of annotations.string;

//// Validates that the annotated character sequence is between
//// min and max included.
@immutable
class Length {
  final String message;
  final double min;
  final double max;
  const Length({
    this.min,
    this.max,
    this.message,
  });
}
