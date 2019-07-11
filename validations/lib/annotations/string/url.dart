part of annotations.string;

//// Checks if the annotated character sequence is a valid URL according to
//// RFC2396. If any of the optional parameters protocol, host or port are
//// specified, the corresponding URL fragments must match the specified values.
//// The optional parameter regexp allow to specify an additional
//// regular expression which the URL must match.
@immutable
class URL extends ValidatorAnnotation {
  final String protocol;
  final String host;
  final int port;
  final String regexp;

  const URL({
    this.protocol,
    this.host,
    this.port,
    this.regexp,
    String message,
    List<String> groups,
  }) : super(message, groups);
}
