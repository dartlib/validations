part of annotations.string;

//// Checks if the annotated string matches the regular expression [RegExp] pattern.
@immutable
class Pattern extends ValidatorAnnotation {
  final String regexp;
  const Pattern({
    @required this.regexp,
    message,
    groups,
  }) : super(message, groups);
}
