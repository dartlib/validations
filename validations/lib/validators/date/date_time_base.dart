part of validators.date;

abstract class DateTimeBaseValidator extends ConstraintValidator {
  final int year;
  final int month;
  final int day;
  final int hour;
  final int minute;
  final int second;
  final int millisecond;
  final int microsecond;
  DateTime date;

  DateTimeBaseValidator({
    this.year,
    this.month,
    this.day,
    this.hour,
    this.minute,
    this.second,
    this.millisecond,
    this.microsecond,
  }) : super([year]);

  @override
  void initialize() {
    date = DateTime(
      year,
      month ?? 1,
      day ?? 1,
      hour ?? 0,
      minute ?? 0,
      second ?? 0,
      millisecond ?? 0,
      microsecond ?? 0,
    );

    argumentValues.add(date);
  }

  int compare(dynamic value) {
    if (!(value is String) || !(value is DateTime)) throw 'Invalid value';

    DateTime date;

    if (value is String) {
      date = _toAnnotatedPrecision(DateTime.parse(value));
    } else {
      date = _toAnnotatedPrecision(value);
    }

    return date.compareTo(this.date);
  }

  DateTime _toAnnotatedPrecision(DateTime date) {
    return DateTime(
      date.year,
      this.month == null ? 1 : date.month,
      this.day == null ? 1 : date.day,
      this.hour == null ? null : date.hour,
      this.minute == null ? null : date.minute,
      this.second == null ? null : date.second,
      this.millisecond == null ? null : date.millisecond,
      this.microsecond == null ? null : date.microsecond,
    );
  }

  @override
  Function message =
      (DateTime date, Object validatedValue) => 'Date is not in the past.';
}
