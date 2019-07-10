part of validators.number;

class PositiveOrZeroValidator extends ConstraintValidator {
  @override
  bool isValid(dynamic value, [ValueContext context]) {
    return !num.parse(value).isNegative || value == 0;
  }

  @override
  Function message =
      (Object validatedValue) => 'Value is not a positive number or zero.';
}
