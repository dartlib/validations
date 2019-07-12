part of annotations.date;

/// Checks whether the annotated date is in the future
@immutable
class InFuture extends ValidatorAnnotation {
  const InFuture({
    String message,
    List<String> groups,
  }) : super(message, groups);
}
