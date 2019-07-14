part of annotations.string;

/// Checks that the annotated string is uppercase.
@immutable
class Uppercase extends ValidatorAnnotation {
  const Uppercase({
    String message,
    List<String> groups,
  }) : super(message, groups);
}
