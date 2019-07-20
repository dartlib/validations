part of validators.string;

/// Checks whether the value is a valid UUID.
///
/// Supported types: [String]
class UuidValidator extends ConstraintValidator {
  // UUID version (3, 4, or 5)
  final int version;

  UuidValidator({this.version}) : super([version]);

  @override
  bool isValid(dynamic value, ValueContext context) {
    return value is String && isUUID(value, version);
  }

  @override
  Function message = (int version, Object validatedValue) => 'Uuid is invalid.';
}
