part of validators.date;

class PastValidator extends DateTimeBaseValidator {
  final int year;
  final int month;
  final int day;
  final int hour;
  final int minute;
  final int second;
  final int millisecond;
  final int microsecond;
  DateTime date;

  PastValidator({
    this.year,
    this.month,
    this.day,
    this.hour,
    this.minute,
    this.second,
    this.millisecond,
    this.microsecond,
  }) : super(
          year: year,
          month: month,
          day: day,
          hour: hour,
          minute: minute,
          second: second,
          millisecond: millisecond,
          microsecond: microsecond,
        );

  @override
  bool isValid(dynamic value, [ValueContext context]) {
    try {
      return this.compare(value).isNegative;
    } catch (_) {
      return false;
    }
  }

  @override
  Function message =
      (DateTime date, Object validatedValue) => 'Date is not in the past.';
}
