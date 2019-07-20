part of validators.string;

/// Checks if the value is in all lowercase.
///
/// Supported types: [String]
class LowercaseValidator extends ConstraintValidator {
  @override
  bool isValid(dynamic value, ValueContext context) {
    return value is String && isLowercase(value);
  }

  @override
  Function message =
      (Object validatedValue) => 'String should be in lowercase.';
}
