part of validators.basic;

/// Check that a [String] is empty. A `null` value is considered valid.
class BlankValidator extends ConstraintValidator {
  @override
  bool isValid(dynamic value, ValueContext context) {
    return value == '';
  }

  @override
  Function message = (Object validatedValue) => 'Value must be blank';
}
