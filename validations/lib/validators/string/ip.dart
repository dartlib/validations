part of validators.string;

/// Checks if the value is a valid ip address.
///
/// Supported types: [String]
class IpValidator extends ConstraintValidator {
  // Protocol version [4 or 6]
  final int version;
  IpValidator({
    this.version,
  }) : super([version]);
  @override
  bool isValid(Object value, [ValueContext context]) {
    return value is String && isIP(value, version);
  }

  @override
  Function message = (int version, Object validatedValue) => 'Invalid IP';
}
