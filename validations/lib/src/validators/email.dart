import 'package:validators/validators.dart' show isEmail;

import '../validator/constraint_validator.dart';
import '../validator/value_context.dart';

class EmailValidator extends ConstraintValidator {
  @override
  bool isValid(Object value, [ValueContext context]) {
    return isEmail(value);
  }

  @override
  Function message = (Object validatedValue) => 'Invalid email address';
}
