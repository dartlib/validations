part of validators.number;

class NegativeValidator extends ConstraintValidator {
  @override
  bool isValid(dynamic value, [ValueContext context]) {
    return num.parse(value).isNegative;
  }

  @override
  Function message =
      (Object validatedValue) => 'Value is not a negative number.';
}
