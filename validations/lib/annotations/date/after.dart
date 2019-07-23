part of annotations.date;

/// Checks whether the annotated date is after the specified date.
@immutable
@Constraint(validatedBy: AfterValidator)
class After extends ValidatorAnnotation {
  final int year;
  final int month;
  final int day;
  final int hour;
  final int minute;
  final int second;
  final int millisecond;
  final int microsecond;
  const After({
    this.year,
    this.month = 1,
    this.day = 1,
    this.hour = 0,
    this.minute = 0,
    this.second = 0,
    this.millisecond = 0,
    this.microsecond = 0,
    String message,
    List<String> groups,
  }) : super(message, groups);
}
