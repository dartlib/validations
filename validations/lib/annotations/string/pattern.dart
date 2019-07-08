part of annotations.string;

/// Checks if the annotated string matches the regular expression [regexp]
@immutable
class Pattern {
  final String message;
  final RegExp regexp;
  const Pattern({
    @required this.regexp,
    this.message,
  });
}
