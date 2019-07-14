part of validators.string;

/// Checks if the value is a valid JSON string.
///
/// Supported types: [String]
class JsonValidator extends ConstraintValidator {
  @override
  bool isValid(Object value, [ValueContext context]) {
    return isJSON(value);
  }

  @override
  Function message = (Object validatedValue) => 'Invalid JSON';
}
