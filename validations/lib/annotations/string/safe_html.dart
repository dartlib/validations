part of annotations.string;

//// checks whether the annotated element is safe html
@immutable
class SafeHtml {
  final String message;
  const SafeHtml({
    this.message,
  });
}
