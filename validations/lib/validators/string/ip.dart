part of validators.string;

class IpValidator extends ConstraintValidator {
  final int version;
  IpValidator({
    this.version,
  }) : super([version]);
  @override
  bool isValid(Object value, [ValueContext context]) {
    return isIP(value, version);
  }

  @override
  Function message = (int version, Object validatedValue) => 'Invalid IP';
}
