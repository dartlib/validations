part of validators.string;

/// Checks if the value is a valid hexadecimal.
///
/// Supported types: [String]
class HexadecimalValidator extends ConstraintValidator {
  @override
  bool isValid(dynamic value, [ValueContext context]) {
    return value is String && isHexadecimal(value);
  }

  @override
  Function message = (Object validatedValue) => 'String is not an hexadecimal.';
}
