part of annotations.string;

//// Checks whether the specified character sequence is a valid email address.
@immutable
class Email extends ValidatorAnnotation {
  const Email({
    message,
    groups,
  }) : super(message, groups);
}
