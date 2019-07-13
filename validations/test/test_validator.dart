import 'package:test_api/test_api.dart' as t;
import 'package:validations/validator.dart';

class TestValidator {
  final ConstraintValidator validator;

  TestValidator(this.validator);

  void isValid(Set input, [String name]) {
    _testValidator(input, true);
  }

  void isInvalid(Set input, [String name]) {
    _testValidator(input, false, name);
  }

  static void throwsA<T>(Function expression) {
    t.test('Throws a ${T.runtimeType} error', () {
      t.expect(
        expression,
        t.throwsA(t.TypeMatcher<T>()),
      );
    });
  }

  void _testValidator<T>(Set input, bool expected, [String name]) {
    t.test(name ?? validator.runtimeType, () {
      for (var data in input) {
        t.expect(
          validator.validate(data),
          expected,
          reason: 'Expected `$data` to be ${expected ? 'valid' : 'invalid'}',
        );
      }
    });
  }
}
