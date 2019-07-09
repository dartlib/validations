part of validators.string;

class LowercaseValidator extends ConstraintValidator {
  @override
  bool isValid(dynamic value, [ValueContext context]) {
    return isLowercase(value);
  }

  @override
  Function message =
      (Object validatedValue) => 'String should be in lowercase.';
}
