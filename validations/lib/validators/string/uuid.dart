part of validators.string;

class UuidValidator extends ConstraintValidator {
  final int version;

  UuidValidator({this.version}) : super([version]);

  @override
  bool isValid(dynamic value, [ValueContext context]) {
    return value is String && isUUID(value, version);
  }

  @override
  Function message = (int version, Object validatedValue) => 'Uuid is invalid.';
}
