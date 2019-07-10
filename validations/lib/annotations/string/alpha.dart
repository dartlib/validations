part of annotations.string;

//// Checks that the annotated character sequence contains only alpha characters [A-z].
@immutable
class Alpha extends ValidatorAnnotation {
  const Alpha({
    message,
    groups,
  }) : super(message, groups);
}
