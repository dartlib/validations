part of validators.number;

/// Checks whether the value is negative.
///
/// Supported types: [num], [String]
class NegativeValidator extends ConstraintValidator {
  @override
  bool isValid(dynamic value, [ValueContext context]) {
    try {
      final number = parseNum(value);
      return number < 0;
    } catch (_) {
      return false;
    }
  }

  @override
  Function message =
      (Object validatedValue) => 'Value is not a negative number.';
}
