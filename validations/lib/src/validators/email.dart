import 'package:validators/validators.dart' show isEmail;

import '../constraint_validator.dart';
import '../validator_context.dart';

class EmailValidator extends ConstraintValidator {
  @override
  bool isValid(Object value, [ValidatorContext context]) {
    return isEmail(value);
  }

  @override
  Function message = (Object validatedValue) => 'Invalid email address';
}
