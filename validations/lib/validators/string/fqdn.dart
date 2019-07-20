part of validators.string;

/// Checks whether the value is a valid fully qualified domain name.
///
/// Supported types: [String]
class FqdnValidator extends ConstraintValidator {
  /// Whether to require a top level domain.
  final bool requireTld;

  /// Whether to allow underscores.
  final bool allowUnderscores;
  FqdnValidator({
    this.requireTld = true,
    this.allowUnderscores = false,
  }) : super([requireTld, allowUnderscores]);
  @override
  bool isValid(Object value, ValueContext context) {
    return value is String &&
        isFQDN(
          value,
          requireTld: requireTld,
          allowUnderscores: allowUnderscores,
        );
  }

  @override
  Function message = (
    bool requireTld,
    bool allowUnderscores,
    Object validatedValue,
  ) =>
      'Invalid domain name';
}
