part of annotations.string;

/// Checks if the annotated character sequence is a valid URL according to
/// RFC2396. If any of the optional parameters protocol, host or port are
/// specified, the corresponding URL fragments must match the specified values.
/// The optional parameters regexp and flags allow to specify an additional
/// regular expression (including regular expression flags) which the URL must
/// match.
@immutable
class URL {
  final String message;
  const URL({
    this.message,
  });
}
