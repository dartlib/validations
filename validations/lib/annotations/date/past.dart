part of annotations.date;

//// Checks whether the annotated date is in the past
@immutable
class Past extends ValidatorAnnotation {
  final int year;
  final int month;
  final int day;
  final int hour;
  final int minute;
  final int second;
  final int millisecond;
  final int microsecond;
  const Past({
    @required this.year,
    this.month,
    this.day,
    this.hour,
    this.minute,
    this.second,
    this.millisecond,
    this.microsecond,
    message,
    groups,
  })  : assert(year != null),
        super(message, groups);
}
