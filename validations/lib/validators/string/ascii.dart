part of validators.string;

class AsciiValidator extends ConstraintValidator {
  @override
  bool isValid(dynamic value, [ValueContext context]) {
    return isAscii(value);
  }

  @override
  Function message = (Object validatedValue) => 'String is not valid ASCII.';
}
