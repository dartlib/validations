part of annotations.string;

/// Checks that the annotated string is a valid ISBN.
/// type determines the type of ISBN. The default is ISBN-13.
@immutable
class ISBN {
  final String message;
  final String type;
  const ISBN({
    this.message,
    this.type = 'ISBN-13',
  });
}
