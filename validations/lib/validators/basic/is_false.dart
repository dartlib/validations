part of validators.basic;

class IsFalseValidator extends ConstraintValidator {
  @override
  bool allowNull = false;

  @override
  bool isValid(dynamic value, [ValueContext context]) {
    return value == false || value == null;
  }

  @override
  Function message = (Object validatedValue) => 'Value is not false';
}
