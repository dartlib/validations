part of validators.basic;

class IsTrueValidator extends ConstraintValidator {
  @override
  bool isValid(dynamic value, [ValueContext context]) {
    return value == true;
  }

  @override
  Function message = (Object validatedValue) => 'Value is not true';
}
