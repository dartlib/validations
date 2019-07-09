part of validators.basic;

class BlankValidator extends ConstraintValidator {
  @override
  bool isValid(dynamic value, [ValueContext context]) {
    if (value == null) return true;

    return value.toString().trim().isEmpty;
  }

  @override
  Function message = (Object validatedValue) => 'Value must be blank';
}
