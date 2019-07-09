import 'package:test/test.dart' as t;
import 'package:validations/validations.dart';

const group = t.group;
const setUp = t.setUp;
const test = t.test;
const expect = t.expect;
const throwsA = t.throwsA;
const yep = t.isTrue;
const nope = t.isFalse;

void main() {
  group('Validators', () {
    setUp(() {});

    test('AssertFalse', () {
      expect(IsFalseValidator().isValid(false), yep);
      expect(IsFalseValidator().isValid(null), nope);
      expect(IsFalseValidator().isValid(true), nope);
      expect(IsFalseValidator().isValid(''), nope);
    });

    test('AssertTrue', () {
      expect(IsTrueValidator().isValid(true), yep);
      expect(IsTrueValidator().isValid(false), nope);
      expect(IsTrueValidator().isValid(null), nope);
      expect(IsTrueValidator().isValid(''), nope);
    });

    test('CreditCardNumber', () {
      expect(
        CreditCardNumberValidator().isValid('4111 1111 1111 1111'),
        true,
      ); // visa
      expect(
        CreditCardNumberValidator().isValid('5500 0000 0000 0004'),
        true,
      ); // MasterCard
      expect(
        CreditCardNumberValidator().isValid('3400 0000 0000 009'),
        true,
      ); // American Express
      expect(
        CreditCardNumberValidator().isValid('3000 0000 0000 04 '),
        true,
      ); // Diner's Club
      expect(
        CreditCardNumberValidator().isValid('6011 0000 0000 0004'),
        true,
      ); // Carte Blanche

      // expect(
      //   CreditCardNumberValidator().isValid('2014 0000 0000 009'),
      //   true,
      // ); // en Route

      // expect(
      //  CreditCardNumberValidator().isValid('3088 0000 0000 0009'),
      //  true,
      // ); // JCB

      expect(CreditCardNumberValidator().isValid('3088 0000'), false);
      expect(CreditCardNumberValidator().isValid('30000'), false);
      expect(CreditCardNumberValidator().isValid(3), false);
      expect(CreditCardNumberValidator().isValid(null), false);
      expect(CreditCardNumberValidator().isValid(true), false);
    });

    test('DecimalMax', () {
      expect(
        // ignore: missing_required_param
        () => DecimalMaxValidator(),
        throwsA(t.TypeMatcher<AssertionError>()),
      );
      expect(DecimalMaxValidator(value: '6.0').isValid('5.0'), isTrue);
      expect(DecimalMaxValidator(value: '5.0').isValid('6.0'), isFalse);
      expect(DecimalMaxValidator(value: '5.0').isValid('5.0'), isFalse);
      expect(
        DecimalMaxValidator(value: '5.0', inclusive: true).isValid('5.0'),
        isTrue,
      );
      expect(
        () => DecimalMaxValidator(value: 'A.B').isValid('Q'),
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
      expect(DecimalMinValidator(value: '5.0').isValid('6.0'), isTrue);
      expect(DecimalMinValidator(value: '6.0').isValid('5.0'), isFalse);
      expect(DecimalMinValidator(value: '6.0').isValid('5.0'), isFalse);
      expect(
        DecimalMinValidator(value: '5.0', inclusive: true).isValid('5.0'),
        isTrue,
      );
      expect(
        () => DecimalMinValidator(value: 'A.B').isValid('Q'),
        throwsA(
          t.TypeMatcher<FormatException>(),
        ),
      );
    });

    test('Email', () {
      expect(EmailValidator().isValid('test@test.com'), isTrue);
      expect(EmailValidator().isValid('test.com'), isFalse);
      expect(EmailValidator().isValid('test'), isFalse);
    });

    test('ISBN', () {
      expect(ISBNValidator().isValid('978-3-16-148410-0'), isTrue);
      expect(ISBNValidator().isValid('1234'), isFalse);
    });

    test('Max', () {
      expect(
        // ignore: missing_required_param
        () => MaxValidator(),
        throwsA(t.TypeMatcher<AssertionError>()),
      );
      var validator = MaxValidator(value: 5);

      expect(validator.isValid(null), isFalse);
      expect(validator.isValid(''), isFalse);
      expect(validator.isValid(true), isFalse);
      expect(validator.isValid(false), isFalse);
      expect(validator.isValid(4), isTrue);
      expect(validator.isValid(5), isTrue);
    });

    test('Min', () {
      expect(
        // ignore: missing_required_param
        () => MinValidator(),
        throwsA(t.TypeMatcher<AssertionError>()),
      );
      var validator = MinValidator(value: 5);

      expect(validator.isValid(null), isFalse);
      expect(validator.isValid(''), isFalse);
      expect(validator.isValid(true), isFalse);
      expect(validator.isValid(false), isFalse);
      expect(validator.isValid(4), isFalse);
      expect(validator.isValid(5), isTrue);
      expect(validator.isValid(6), isTrue);
    });

    test('NotNull', () {
      expect(NotNullValidator().isValid(null), isFalse);
      expect(NotNullValidator().isValid(''), isTrue);
      expect(NotNullValidator().isValid(true), isTrue);
      expect(NotNullValidator().isValid(false), isTrue);
      expect(NotNullValidator().isValid(1), isTrue);
    });

    test('Null', () {
      expect(NullValidator().isValid(null), isTrue);
      expect(NullValidator().isValid(''), isFalse);
      expect(NullValidator().isValid(true), isFalse);
      expect(NullValidator().isValid(false), isFalse);
      expect(NullValidator().isValid(1), isFalse);
    });

    test('Size', () {
      var validator = SizeValidator(min: 2, max: 5);

      expect(validator.isValid(1), isFalse);
      expect(validator.isValid(2), isTrue);
      expect(validator.isValid(3), isTrue);
      expect(validator.isValid(5), isTrue);
      expect(validator.isValid(6), isFalse);

      expect(validator.isValid('A'), isFalse);
      expect(validator.isValid('AB'), isTrue);
      expect(validator.isValid('ABC'), isTrue);
      expect(validator.isValid('ABCDE'), isTrue);
      expect(validator.isValid('ABCDEF'), isFalse);
    });
  });
}
