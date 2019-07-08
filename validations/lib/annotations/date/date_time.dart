part of annotations.date;

/// Checks whether the annotated date is in the future
@immutable
class DateTime extends ValidatorAnnotation {
  final String format;
  const DateTime({
    this.format,
    message,
    groups,
  }) : super(message, groups);
}
