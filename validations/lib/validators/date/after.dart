part of validators.date;

class AfterValidator extends DateTimeBaseValidator {
  AfterValidator({
    int year,
    int month,
    int day,
    int hour,
    int minute,
    int second,
    int millisecond,
    int microsecond,
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
  bool isValid(Object value, [ValueContext context]) {
    try {
      return compare(toDateTime(value)) > 0;
    } catch (_) {
      return false;
    }
  }

  @override
  Function message = (DateTime date, Object validatedValue) =>
      'Date is not after the specified date.';
}
