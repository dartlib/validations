part of validators.string;

class AlphaValidator extends ConstraintValidator {
  @override
  bool isValid(dynamic value, [ValueContext context]) {
    return value is String && isAlpha(value);
  }

  @override
  Function message = (Object validatedValue) => 'String is not alpha.';
}
