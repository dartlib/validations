part of validators.string;

class FloatValidator extends ConstraintValidator {
  @override
  bool isValid(dynamic value, [ValueContext context]) {
    return isFloat(value);
  }

  @override
  Function message =
      (Object validatedValue) => 'String is not an floating point number.';
}
