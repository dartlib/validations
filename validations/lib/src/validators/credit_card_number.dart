import 'package:validators/validators.dart' show isCreditCard;

import '../constraint_validator.dart';
import '../validator_context.dart';

class CreditCardNumberValidator extends ConstraintValidator {
  @override
  bool isValid(Object value, [ValueContext context]) {
    return value is String && isCreditCard(value);
  }

  @override
  Function message = (Object validatedValue) => 'Creditcard is invalid';
}
