part of annotations.date;

/// Checks whether the annotated date is before the specified date.
@immutable
@Constraint(validatedBy: BeforeValidator)
class Before extends ValidatorAnnotation {
  final int year;
  final int month;
  final int day;
  final int hour;
  final int minute;
  final int second;
  final int millisecond;
  final int microsecond;
  const Before({
    @required this.year,
    this.month,
    this.day,
    this.hour,
    this.minute,
    this.second,
    this.millisecond,
    this.microsecond,
    String message,
    List<String> groups,
  })  : assert(year != null),
        super(message, groups);
}
