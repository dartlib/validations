part of validators.basic;

class BlankValidator extends ConstraintValidator {
  @override
  bool isValid(dynamic value, [ValueContext context]) {
    return value == '';
  }

  @override
  Function message = (Object validatedValue) => 'Value must be blank';
}
