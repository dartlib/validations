part of validators.string;

class HexColorValidator extends ConstraintValidator {
  @override
  bool isValid(dynamic value, [ValueContext context]) {
    return isHexColor(value);
  }

  @override
  Function message = (Object validatedValue) => 'String is not a hex color.';
}
