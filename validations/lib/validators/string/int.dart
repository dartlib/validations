part of validators.string;

class IntValidator extends ConstraintValidator {
  @override
  bool isValid(dynamic value, [ValueContext context]) {
    return isInt(value);
  }

  @override
  Function message = (Object validatedValue) => 'String is not an integer.';
}
