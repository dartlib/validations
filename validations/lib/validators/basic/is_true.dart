part of validators.basic;

/// Check that the validated value is `true`.
///
/// Supported types: Any type.
class IsTrueValidator extends ConstraintValidator {
  @override
  bool allowNull = false;

  @override
  bool isValid(dynamic value, ValueContext context) {
    return value == true;
  }

  @override
  Function message = (Object validatedValue) => 'Value is not true';
}
