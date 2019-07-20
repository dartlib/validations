part of validators.basic;

/// Check that a value is not `null`.
class NotNullValidator extends ConstraintValidator {
  @override
  bool allowNull = false;

  @override
  bool isValid(dynamic value, ValueContext context) {
    return value != null;
  }

  @override
  Function message = (Object validatedValue) => 'Value cannot be null';
}
