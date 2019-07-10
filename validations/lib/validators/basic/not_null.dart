part of validators.basic;

class NotNullValidator extends ConstraintValidator {
  bool allowNull = false;

  @override
  bool isValid(dynamic value, [ValueContext context]) {
    return value != null;
  }

  @override
  Function message = (Object validatedValue) => 'Value cannot be null';
}
