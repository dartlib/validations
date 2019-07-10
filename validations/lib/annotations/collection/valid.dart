part of annotations.collection;

//// Checks that the annotated [Type] is valid.
//// It's expected this annotation [Type] contains validation annotations itself.
@immutable
class Valid extends ValidatorAnnotation {
  const Valid({
    message,
    groups,
  }) : super(message, groups);
}
