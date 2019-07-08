part of validators.basic;

class AssertFalseValidator extends ConstraintValidator {
  @override
  bool isValid(dynamic value, [ValueContext context]) {
    return value == false;
  }

  @override
  Function message = (Object validatedValue) => 'Value is not false';
}
