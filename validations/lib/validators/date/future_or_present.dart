part of validators.date;

class FutureOrPresentValidator extends TimeUnitBaseValidator {
  FutureOrPresentValidator({
    Object timeUnit,
  }) : super(timeUnit: timeUnit);

  @override
  bool isValid(dynamic value, [ValueContext context]) {
    return _isAfter(timeUnit, date, toDateTime(value), true);
  }

  @override
  Function message =
      (TimeUnit timeUnit, DateTime date, Object validatedValue) =>
          'Date is not in the future or present.';
}
