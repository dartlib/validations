part of validators.date;

class PastOrPresentValidator extends ConstraintValidator {
  DateTime date;
  @override
  void initialize() {
    date = DateTime.now();

    argumentValues.add(date);
  }

  @override
  bool isValid(dynamic value, [ValueContext context]) {
    try {
      return value.compareTo(date) <= 0;
    } catch (_) {
      return false;
    }
  }

  @override
  Function message = (DateTime date, Object validatedValue) =>
      'Date is not in the past or present.';
}
