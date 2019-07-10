part of validators.number;

class NegativeOrZeroValidator extends ConstraintValidator {
  @override
  bool isValid(dynamic value, [ValueContext context]) {
    return num.parse(value).isNegative || value == 0;
  }

  @override
  Function message =
      (Object validatedValue) => 'Value is not a negative number or zero.';
}
