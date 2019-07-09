part of validators.basic;

class IsEmptyValidator extends ConstraintValidator {
  @override
  bool isValid(dynamic value, [ValueContext context]) {
    if (value == null) return true;

    return value.toString().isEmpty;
  }

  @override
  Function message = (Object validatedValue) => 'Value must be empty';
}
