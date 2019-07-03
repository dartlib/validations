import 'package:validators/validators.dart' show isCreditCard;

import '../constraint_validator.dart';
import '../validator_context.dart';

class CreditCardNumberValidator extends ConstraintValidator {
  @override
  bool isValid(Object value, ValidatorContext context) {
    // should already imply the value must be a string.
    return value is String && isCreditCard(value);
  }

  @override
  Function message = () => 'Creditcard is invalid';
}
