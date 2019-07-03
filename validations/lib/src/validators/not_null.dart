import '../constraint_validator.dart';
import '../validator_context.dart';

class NotNullValidator extends ConstraintValidator {
  @override
  bool isValid(dynamic value, ValidatorContext context) {
    return value != null;
  }

  @override
  Function message = () => 'Value cannot be null';
}
