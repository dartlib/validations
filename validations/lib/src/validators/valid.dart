import '../../validations.dart';
import '../constraint_validator.dart';
import '../validator_context.dart';

class ValidValidator extends ConstraintValidator<Valid> {
  Validator validator;
  ValidValidator(this.validator);

  @override
  bool isValid(dynamic value, [ValueContext context]) {
    if (value == null) return true;

    Set<ConstraintViolation> violations = validator.validate(value, context);

    validator.validationContext.constraintViolations.addAll(violations);

    return value != null && violations.isEmpty;
  }

  @override
  Function message =
      (Object validatedValue) => '${validatedValue.runtimeType} is not valid';
}
