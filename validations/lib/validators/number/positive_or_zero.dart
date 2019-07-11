part of validators.number;

class PositiveOrZeroValidator extends ConstraintValidator {
  @override
  bool isValid(dynamic value, [ValueContext context]) {
    try {
      return !parseNum(value).isNegative || value == 0;
    } catch (_) {
      return false;
    }
  }

  @override
  Function message =
      (Object validatedValue) => 'Value is not a positive number or zero.';
}
