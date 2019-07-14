part of validators.string;

/// Checks whether the value contains of only alpha characters.
///
/// Supported types: [String]
class AlphaValidator extends ConstraintValidator {
  @override
  bool isValid(dynamic value, [ValueContext context]) {
    return value is String && isAlpha(value);
  }

  @override
  Function message = (Object validatedValue) => 'String is not alpha.';
}
