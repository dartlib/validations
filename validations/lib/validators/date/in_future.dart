part of validators.date;

class InFutureValidator extends TimeUnitBaseValidator {
  InFutureValidator({
    Object timeUnit,
  }) : super(timeUnit: timeUnit);

  @override
  bool isValid(dynamic value, [ValueContext context]) {
    return _isAfter(timeUnit, date, toDateTime(value), false);
  }

  @override
  Function message =
      (TimeUnit timeUnit, DateTime date, Object validatedValue) =>
          'Date is not in the future.';
}
