part of annotations.basic;

/// Checks that the annotated string is not null and the trimmed
/// length is greater than 0.
@immutable
class NotBlank extends ValidatorAnnotation {
  const NotBlank({
    String message,
    List<String> groups,
  }) : super(message, groups);
}
