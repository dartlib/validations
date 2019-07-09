part of annotations.string;

/// Checks that the annotated character sequence contains only alpha characters [A-z].
@immutable
class Alpha {
  final String message;
  const Alpha({
    this.message,
  });
}
