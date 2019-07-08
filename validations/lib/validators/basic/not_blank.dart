part of validators.basic;

class NotBlankValidator extends ConstraintValidator {
  @override
  bool isValid(dynamic value, [ValueContext context]) {
    if (value == null) return true;

    return value.toString().trim().isNotEmpty;
  }

  @override
  Function message = (Object validatedValue) => 'Value cannot be blank';
}
