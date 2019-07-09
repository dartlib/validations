part of validators.basic;

class TypeValidator extends ConstraintValidator {
  Type type;
  TypeValidator(this.type);

  @override
  bool isValid(dynamic value, [ValueContext context]) {
    if (value == null) return true;

    return value.runtimeType == type;
  }

  @override
  Function message = (Object validatedValue) => 'Value must be blank';
}
