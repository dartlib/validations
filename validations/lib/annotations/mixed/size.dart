part of annotations.mixed;

/// Checks if the annotated element’s size is between [min] and [max] (inclusive)
@immutable
class Size {
  final int min;
  final int max;
  final String message;
  const Size({
    this.min,
    this.max,
    this.message,
  });
}
