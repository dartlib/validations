part of validators.basic;

/// Check that a value is `null`.
class NullValidator extends ConstraintValidator {
  @override
  bool allowNull = false;

  @override
  bool isValid(dynamic value, [ValueContext context]) {
    return value == null;
  }

  @override
  Function message = (Object validatedValue) => 'Value must be null';
}
