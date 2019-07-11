part of validators.number;

class PositiveValidator extends ConstraintValidator {
  @override
  bool isValid(dynamic value, [ValueContext context]) {
    try {
      return !parseNum(value).isNegative;
    } catch (_) {
      return false;
    }
  }

  @override
  Function message =
      (Object validatedValue) => 'Value is not a positive number.';
}
