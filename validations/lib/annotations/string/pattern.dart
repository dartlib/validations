part of annotations.string;

/// Checks if the annotated string matches the regular expression [RegExp] pattern.
@immutable
@Constraint(validatedBy: PatternValidator)
class Pattern extends ValidatorAnnotation {
  final String regexp;
  const Pattern({
    @required this.regexp,
    String message,
    List<String> groups,
  }) : super(message, groups);
}
