part of validators.date;

class InFutureValidator extends ConstraintValidator {
  DateTime date;
  @override
  void initialize() {
    date = DateTime.now();

    argumentValues.add(date);
  }

  @override
  bool isValid(dynamic value, [ValueContext context]) {
    try {
      return value.compareTo(toDateTime(date)) > 0 as bool;
    } catch (_) {
      return false;
    }
  }

  @override
  Function message =
      (DateTime date, Object validatedValue) => 'Date is not in the future.';
}
