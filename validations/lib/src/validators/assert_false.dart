import '../constraint_validator.dart';
import '../validator_context.dart';

class AssertFalseValidator extends ConstraintValidator {
  @override
  final String message = 'Value is not false';

  @override
  bool isValid(dynamic value, ValidatorContext context) {
    return value == false;
  }
}
