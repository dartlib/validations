part of validators.date;

class PastValidator extends TimeUnitBaseValidator {
  PastValidator({
    Object timeUnit,
  }) : super(timeUnit: timeUnit);

  @override
  bool isValid(dynamic value, [ValueContext context]) {
    return _isBefore(timeUnit, date, toDateTime(value), false);
  }

  @override
  Function message =
      (DateTime date, Object validatedValue) => 'Date is not in the past.';
}
