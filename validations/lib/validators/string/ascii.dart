part of validators.string;

/// Checks whether the value contains of only ascii characters.
///
/// Supported types: [String]
class AsciiValidator extends ConstraintValidator {
  @override
  bool isValid(dynamic value, [ValueContext context]) {
    return value is String && isAscii(value);
  }

  @override
  Function message = (Object validatedValue) => 'String is not valid ASCII.';
}
