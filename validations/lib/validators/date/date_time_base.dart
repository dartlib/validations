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
  }) : super([]);

  @override
  void initialize() {
    if (year == null) {
      throw ArgumentError('Year is required');
    } else {
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
    }

    argumentValues.add(date);
  }

  int compare(DateTime value) {
    if (value is! String || value is! DateTime) {
      throw Exception('Invalid value');
    }

    final date = _toAnnotatedPrecision(value);

    return date.compareTo(this.date);
  }

  DateTime _toAnnotatedPrecision(DateTime date) {
    return DateTime(
      date.year,
      month == null ? 1 : date.month,
      day == null ? 1 : date.day,
      hour == null ? null : date.hour,
      minute == null ? null : date.minute,
      second == null ? null : date.second,
      millisecond == null ? null : date.millisecond,
      microsecond == null ? null : date.microsecond,
    );
  }

  @override
  Function message =
      (DateTime date, Object validatedValue) => 'Date is not in the past.';
}
