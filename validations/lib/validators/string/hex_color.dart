part of validators.string;

/// Checks if the value is a valid hex color.
///
/// Supported types: [String]
class HexColorValidator extends ConstraintValidator {
  @override
  bool isValid(dynamic value, ValueContext context) {
    return value is String && isHexColor(value);
  }

  @override
  Function message = (Object validatedValue) => 'String is not a hex color.';
}
