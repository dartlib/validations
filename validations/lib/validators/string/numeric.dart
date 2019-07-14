part of validators.string;

/// Checks
class NumericValidator extends ConstraintValidator {
  @override
  bool isValid(dynamic value, [ValueContext context]) {
    return value is String && isNumeric(value);
  }

  @override
  Function message = (Object validatedValue) => 'String is not numeric.';
}
