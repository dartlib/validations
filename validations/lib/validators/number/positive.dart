part of validators.number;

class PositiveValidator extends ConstraintValidator {
  @override
  bool isValid(dynamic value, [ValueContext context]) {
    return !num.parse(value).isNegative;
  }

  @override
  Function message =
      (Object validatedValue) => 'Value is not a positive number.';
}
