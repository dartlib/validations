import '../validator/constraint_validator.dart';
import '../validator/validator.dart';

abstract class ConstraintValidatorContainer extends ConstraintValidator {
  Validator validator;
  ConstraintValidatorContainer(this.validator, [argumentValues = const []])
      : super(argumentValues);
}
