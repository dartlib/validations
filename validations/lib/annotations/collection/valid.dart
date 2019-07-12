part of annotations.collection;

/// Checks that the annotated [Type] is valid.
/// It's expected this annotation [Type] contains validation annotations itself.
@immutable
class Valid extends ContainerAnnotation {
  const Valid({
    String message,
    List<String> groups,
  }) : super(message, groups);
}
