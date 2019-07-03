import '../constraint_validator.dart';
import '../validator_context.dart';

class AssertTrueValidator extends ConstraintValidator {
  @override
  bool isValid(dynamic value, ValidatorContext context) {
    return value == true;
  }

  @override
  Function message = () => 'Value is not true';
}
