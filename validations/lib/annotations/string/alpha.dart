part of annotations.string;

/// Checks that the annotated string contains only alpha characters [A-z].
@immutable
class Alpha extends ValidatorAnnotation {
  const Alpha({
    String message,
    List<String> groups,
  }) : super(message, groups);
}
