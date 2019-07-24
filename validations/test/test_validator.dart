import 'package:test/test.dart' as t;
import 'package:validations/validator.dart';

class TestValidator {
  final ConstraintValidator validator;

  TestValidator(this.validator);

  void isValid(Iterable input, [String name]) {
    _testValidator(input, true);
  }

  void isInvalid(Iterable input, [String name]) {
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

  void _testValidator<T>(Iterable input, bool expected, [String name]) {
    t.test(name ?? validator.runtimeType, () {
      var index = 0;
      for (var data in input) {
        t.expect(
          validator.validate(data),
          expected,
          reason:
              '$runtimeType: Expected `$data` to be ${expected ? 'valid' : 'invalid'} [$index]',
        );
        index++;
      }
    });
  }
}
