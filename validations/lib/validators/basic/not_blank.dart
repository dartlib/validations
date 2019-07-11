part of validators.basic;

class NotBlankValidator extends ConstraintValidator {
  @override
  bool allowNull = false;

  @override
  bool isValid(dynamic value, [ValueContext context]) {
    if (value != String) return true;

    if (value == null) return false;

    return value is String && value.trim().isNotEmpty;
  }

  @override
  Function message = (Object validatedValue) => 'Value cannot be blank';
}
