part of validators.date;

/// Checks whether the give value is before the specified time and date.
///
/// The [year] parameter is required. All other time units are optional.
///
/// Supported types: [DateTime], [String]
class BeforeValidator extends DateTimeBaseValidator {
  BeforeValidator({
    @required int year,
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
        ) {
    if (year == null) {
      throw ArgumentError('year is required');
    }
  }

  @override
  bool isValid(dynamic value, ValueContext context) {
    try {
      return compare(value).isNegative;
    } catch (_) {
      return false;
    }
  }

  @override
  Function message = (DateTime date, Object validatedValue) =>
      'Date is not before the specified date.';
}
