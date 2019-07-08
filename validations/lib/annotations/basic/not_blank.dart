part of annotations.basic;

/// Checks that the annotated character sequence is not null and the trimmed
/// length is greater than 0.
@immutable
class NotBlank extends ValidatorAnnotation {
  const NotBlank({
    message,
    groups,
  }) : super(message, groups);
}
