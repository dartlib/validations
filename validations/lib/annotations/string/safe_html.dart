part of annotations.string;

/// checks whether the annotated element is safe html
@immutable
class SafeHtml extends ValidatorAnnotation {
  const SafeHtml({
    String message,
    List<String> groups,
  }) : super(message, groups);
}
