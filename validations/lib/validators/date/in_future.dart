part of validators.date;

/// Checks whether the value being checked is within the future.
///
/// The [timeUnit] parameter is required and can be specified by either
/// a [TimeUnit] symbol or a string.
///
/// Valid string values are:
///
///   - year
///   - month
///   - day
///   - hour
///   - minute
///   - second
///   - millisecond
///   - microsecond
///
/// Supported types: [DateTime], [String]
class InFutureValidator extends TimeUnitBaseValidator {
  InFutureValidator({
    Object timeUnit,
  }) : super(timeUnit: timeUnit);

  @override
  bool isValid(dynamic value, ValueContext context) {
    return _isAfter(timeUnit, date, toDateTime(value), false);
  }

  @override
  Function message =
      (TimeUnit timeUnit, DateTime date, Object validatedValue) =>
          'Date is not in the future.';
}
