part of annotations.string;

//// checks whether the annotated element is safe html
@immutable
class SafeHtml extends ValidatorAnnotation {
  const SafeHtml({
    message,
    groups,
  }) : super(message, groups);
}
