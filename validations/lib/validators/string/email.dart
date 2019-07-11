part of validators.string;

class EmailValidator extends ConstraintValidator {
  @override
  bool isValid(Object value, [ValueContext context]) {
    return value is String && isEmail(value);
  }

  @override
  Function message = (Object validatedValue) => 'Invalid email address';
}
