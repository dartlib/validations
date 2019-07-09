part of validators.string;

class AlphaNumericValidator extends ConstraintValidator {
  @override
  bool isValid(dynamic value, [ValueContext context]) {
    return isAlphanumeric(value);
  }

  @override
  Function message = (Object validatedValue) => 'String is not alpha numeric.';
}
