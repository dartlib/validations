import '../validator/constraint_validator.dart';
import '../validator/value_context.dart';

class NotNullValidator extends ConstraintValidator {
  @override
  bool isValid(dynamic value, [ValueContext context]) {
    return value != null;
  }

  @override
  Function message = (Object validatedValue) => 'Value cannot be null';
}
