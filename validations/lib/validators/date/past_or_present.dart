part of validators.date;

class PastOrPresentValidator extends TimeUnitBaseValidator {
  PastOrPresentValidator({
    Object timeUnit,
  }) : super(timeUnit: timeUnit);

  @override
  bool isValid(dynamic value, [ValueContext context]) {
    return _isBefore(timeUnit, date, toDateTime(value), true);
  }

  @override
  Function message = (DateTime date, Object validatedValue) =>
      'Date is not in the past or present.';
}
