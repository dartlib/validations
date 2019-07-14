part of annotations.date;

/// Checks whether the annotated date is in the past
@immutable
class Past extends ValidatorAnnotation {
  final Object timeUnit;
  const Past({
    this.timeUnit,
    String message,
    List<String> groups,
  }) : super(message, groups);
}
