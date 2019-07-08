part of annotations.string;

/// Checks whether the specified character sequence is a valid email address.
@immutable
class Email {
  final String message;
  const Email({
    this.message,
  });
}
