part of validators.string;

/// Checks if the value is in all uppercase.
///
/// Supported types: [String]
class UppercaseValidator extends ConstraintValidator {
  @override
  bool isValid(dynamic value, ValueContext context) {
    return value is String && isUppercase(value);
  }

  @override
  Function message =
      (Object validatedValue) => 'String should be in uppercase.';
}
