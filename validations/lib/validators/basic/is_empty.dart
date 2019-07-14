part of validators.basic;

/// Check that a value is empty.
///
/// Supported types: [Map], [Iterable] and [String]
class IsEmptyValidator extends ConstraintValidator {
  @override
  bool isValid(dynamic value, [ValueContext context]) {
    if (value is Iterable || value is Map || value is String) {
      return value.isEmpty as bool;
    }

    return false;
  }

  @override
  Function message = (Object validatedValue) => 'Value must be empty';
}
