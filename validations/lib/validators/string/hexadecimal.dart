part of validators.string;

class HexadecimalValidator extends ConstraintValidator {
  @override
  bool isValid(dynamic value, [ValueContext context]) {
    return isHexadecimal(value);
  }

  @override
  Function message = (Object validatedValue) => 'String is not an hexadecimal.';
}
