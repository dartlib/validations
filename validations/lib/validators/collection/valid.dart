part of validators.collection;

/// Checks whether the validated object is valid.
///
/// It's expected the validated [Type] contains validation itself.
class ValidValidator extends ConstraintValidatorContainer {
  ValidValidator(Validator validator) : super(validator);

  @override
  bool isValid(dynamic value, [ValueContext context]) {
    if (value == null) return true;

    // TODO
    if (value is List) {
      var valid = true;

      for (Object object in value) {
        // should create new value context here. including the index, name = index.
        final result = _validateObject(object, context);

        if (result) valid = false;
      }

      return valid;
    } else {
      return _validateObject(value);
    }
  }

  bool _validateObject(dynamic value, [ValueContext context]) {
    final violations = validator.validate(value, context);

    validator.validationContext.constraintViolations.addAll(violations);

    return violations.isEmpty;
  }

  @override
  Function message =
      (Object validatedValue) => '${validatedValue.runtimeType} is not valid';
}
