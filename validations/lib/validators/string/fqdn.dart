part of validators.string;

class FqdnValidator extends ConstraintValidator {
  final bool requireTld;
  final bool allowUnderscores;
  FqdnValidator({
    this.requireTld = true,
    this.allowUnderscores = false,
  }) : super([requireTld, allowUnderscores]);
  @override
  bool isValid(Object value, [ValueContext context]) {
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
