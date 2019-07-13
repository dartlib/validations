import 'package:validations/validators/string.dart';

import '../../test_validator.dart';

void main() {
  TestValidator(CreditCardNumberValidator())
    ..isValid({
      null,
      '4111 1111 1111 1111', // visa
      '5500 0000 0000 0004', // MasterCard
      '3400 0000 0000 009', // American Express
      '3000 0000 0000 04', // Diner's Club
      '6011 0000 0000 0004', // Carte Blanche
      // '2014 0000 0000 009', // en Route
      // '3088 0000 0000 0009' // JCB
    })
    ..isInvalid({
      '3088 0000',
      '30000',
      3,
      true,
    });
}
