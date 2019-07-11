import 'package:test/test.dart';
import 'package:validations/validators/string.dart';

void main() {
  test('CreditCardNumberValidator', () {
    expect(CreditCardNumberValidator().validate(null), true);

    expect(
      CreditCardNumberValidator().validate('4111 1111 1111 1111'),
      true,
    ); // visa
    expect(
      CreditCardNumberValidator().validate('5500 0000 0000 0004'),
      true,
    ); // MasterCard
    expect(
      CreditCardNumberValidator().validate('3400 0000 0000 009'),
      true,
    ); // American Express
    expect(
      CreditCardNumberValidator().validate('3000 0000 0000 04 '),
      true,
    ); // Diner's Club
    expect(
      CreditCardNumberValidator().validate('6011 0000 0000 0004'),
      true,
    ); // Carte Blanche

    // expect(
    //   CreditCardNumberValidator().validate('2014 0000 0000 009'),
    //   true,
    // ); // en Route

    // expect(
    //  CreditCardNumberValidator().validate('3088 0000 0000 0009'),
    //  true,
    // ); // JCB

    expect(CreditCardNumberValidator().validate('3088 0000'), false);
    expect(CreditCardNumberValidator().validate('30000'), false);
    expect(CreditCardNumberValidator().validate(3), false);
    expect(CreditCardNumberValidator().validate(true), false);
  });
}
