part of validators.string;

class JsonValidator extends ConstraintValidator {
  @override
  bool isValid(Object value, [ValueContext context]) {
    return isJSON(value);
  }

  @override
  Function message = (Object validatedValue) => 'Invalid JSON';
}
