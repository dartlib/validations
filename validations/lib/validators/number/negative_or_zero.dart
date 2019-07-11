part of validators.number;

class NegativeOrZeroValidator extends ConstraintValidator {
  @override
  bool isValid(dynamic value, [ValueContext context]) {
    try {
      return parseNum(value).isNegative || value == 0;
    } catch (_) {
      return false;
    }
  }

  @override
  Function message =
      (Object validatedValue) => 'Value is not a negative number or zero.';
}
