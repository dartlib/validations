import '../constraint_validator.dart';
import '../validator_context.dart';

class NullValidator extends ConstraintValidator {
  @override
  bool isValid(dynamic value, [ValueContext context]) {
    return value == null;
  }

  @override
  Function message = (Object validatedValue) => 'Value must be null';
}
