import 'package:test/test.dart' as t;
import 'package:validations/validations.dart';

const group = t.group;
const setUp = t.setUp;
const test = t.test;
const expect = t.expect;
const throwsA = t.throwsA;

void main() {
  group('Validators', () {
    setUp(() {});

    test('AssertFalse', () {
      expect(IsFalseValidator().validate(null), true);
      expect(IsFalseValidator().validate(false), true);
      expect(IsFalseValidator().validate(true), false);
      expect(IsFalseValidator().validate(''), false);
    });

    test('AssertTrue', () {
      expect(IsTrueValidator().validate(true), true);
      expect(IsTrueValidator().validate(false), false);
      expect(IsTrueValidator().validate(null), false);
      expect(IsTrueValidator().validate(''), false);
    });

    test('CreditCardNumber', () {
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
      expect(CreditCardNumberValidator().validate(null), false);
      expect(CreditCardNumberValidator().validate(true), false);
    });

    test('DecimalMax', () {
      expect(
        // ignore: missing_required_param
        () => DecimalMaxValidator(),
        throwsA(t.TypeMatcher<AssertionError>()),
      );
      expect(DecimalMaxValidator(value: '6.0').validate('5.0'), true);
      expect(DecimalMaxValidator(value: '5.0').validate('6.0'), false);
      expect(DecimalMaxValidator(value: '5.0').validate('5.0'), false);
      expect(
        DecimalMaxValidator(value: '5.0', inclusive: true).validate('5.0'),
        true,
      );
      expect(
        () => DecimalMaxValidator(value: 'A.B').validate('Q'),
        throwsA(
          t.TypeMatcher<FormatException>(),
        ),
      );
    });

    test('DecimalMin', () {
      expect(
        // ignore: missing_required_param
        () => DecimalMinValidator(),
        throwsA(t.TypeMatcher<AssertionError>()),
      );
      expect(DecimalMinValidator(value: '5.0').validate('6.0'), true);
      expect(DecimalMinValidator(value: '6.0').validate('5.0'), false);
      expect(DecimalMinValidator(value: '6.0').validate('5.0'), false);
      expect(
        DecimalMinValidator(value: '5.0', inclusive: true).validate('5.0'),
        true,
      );
      expect(
        () => DecimalMinValidator(value: 'A.B').validate('Q'),
        throwsA(
          t.TypeMatcher<FormatException>(),
        ),
      );
    });

    test('Email', () {
      expect(EmailValidator().validate('test@test.com'), true);
      expect(EmailValidator().validate('test.com'), false);
      expect(EmailValidator().validate('test'), false);
    });

    test('ISBN', () {
      expect(ISBNValidator().validate('978-3-16-148410-0'), true);
      expect(ISBNValidator().validate('1234'), false);
    });

    test('Max', () {
      expect(
        // ignore: missing_required_param
        () => MaxValidator(),
        throwsA(t.TypeMatcher<AssertionError>()),
      );
      var validator = MaxValidator(value: 5);

      expect(validator.validate(null), false);
      expect(validator.validate(''), false);
      expect(validator.validate(true), false);
      expect(validator.validate(false), false);
      expect(validator.validate(4), true);
      expect(validator.validate(5), true);
    });

    test('Min', () {
      expect(
        // ignore: missing_required_param
        () => MinValidator(),
        throwsA(t.TypeMatcher<AssertionError>()),
      );
      var validator = MinValidator(value: 5);

      expect(validator.validate(null), false);
      expect(validator.validate(''), false);
      expect(validator.validate(true), false);
      expect(validator.validate(false), false);
      expect(validator.validate(4), false);
      expect(validator.validate(5), true);
      expect(validator.validate(6), true);
    });

    test('NotNull', () {
      expect(NotNullValidator().validate(null), false);
      expect(NotNullValidator().validate(''), true);
      expect(NotNullValidator().validate(true), true);
      expect(NotNullValidator().validate(false), true);
      expect(NotNullValidator().validate(1), true);
    });

    test('Null', () {
      expect(NullValidator().validate(null), true);
      expect(NullValidator().validate(''), false);
      expect(NullValidator().validate(true), false);
      expect(NullValidator().validate(false), false);
      expect(NullValidator().validate(1), false);
    });

    test('Size', () {
      var validator = SizeValidator(min: 2, max: 5);

      expect(validator.validate(1), false);
      expect(validator.validate(2), true);
      expect(validator.validate(3), true);
      expect(validator.validate(5), true);
      expect(validator.validate(6), false);

      expect(validator.validate('A'), false);
      expect(validator.validate('AB'), true);
      expect(validator.validate('ABC'), true);
      expect(validator.validate('ABCDE'), true);
      expect(validator.validate('ABCDEF'), false);
    });
  });
}
