part of validator;

abstract class ConstraintValidatorContainer extends ConstraintValidator {
  Validator validator;
  ConstraintValidatorContainer(this.validator,
      [List<dynamic> argumentValues = const []])
      : super(argumentValues);
}
