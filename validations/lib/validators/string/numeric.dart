part of validators.string;

class NumericValidator extends ConstraintValidator {
  @override
  bool isValid(dynamic value, [ValueContext context]) {
    return isNumeric(value);
  }

  @override
  Function message = (Object validatedValue) => 'String is not numeric.';
}
