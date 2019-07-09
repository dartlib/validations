part of annotations.string;

//// Checks if the annotated string matches the regular expression [RegExp] pattern.
@immutable
class Pattern {
  final String message;
  final String regexp;
  const Pattern({
    @required this.regexp,
    this.message,
  });
}
