part of annotations.date;

//// Checks whether the annotated date is in the past
@immutable
class Past extends ValidatorAnnotation {
  const Past({
    message,
    groups,
  }) : super(message, groups);
}
