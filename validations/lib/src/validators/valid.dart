import '../../validations.dart';
import '../validator/constraint_validator_container.dart';
import '../validator/constraint_violation.dart';
import '../validator/value_context.dart';

class ValidValidator extends ConstraintValidatorContainer<Valid> {
  ValidValidator(validator) : super(validator);

  @override
  bool isValid(dynamic value, [ValueContext context]) {
    if (value == null) return true;

    // TODO
    if (value is List) {
      bool valid = true;

      value.forEach((Object object) {
        // should create new value context here. including the index, name = index.
        final result = _validateObject(object, context);

        if (result.notEmpty) valid = false;
      });

      return valid;
    } else {
      return _validateObject(value);
    }
  }

  _validateObject(dynamic value, [ValueContext context]) {
    Set<ConstraintViolation> violations = validator.validate(value, context);

    validator.validationContext.constraintViolations.addAll(violations);

    return violations.isEmpty;
  }

  @override
  Function message =
      (Object validatedValue) => '${validatedValue.runtimeType} is not valid';
}
