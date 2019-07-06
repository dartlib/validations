import '../validator/constraint_validator.dart';
import '../validator/validator.dart';

abstract class ConstraintValidatorContainer<T> extends ConstraintValidator<T> {
  Validator validator;
  ConstraintValidatorContainer(this.validator, [argumentValues = const []])
      : super(argumentValues);
}
