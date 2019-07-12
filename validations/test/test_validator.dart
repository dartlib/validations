import 'package:test_api/test_api.dart';
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

  void _testValidator<T>(Set input, bool expected, [String name]) {
    test(name ?? validator.runtimeType, () {
      for (var data in input) {
        expect(
          validator.validate(data),
          expected,
          reason: 'Expected `$data` to be ${expected ? 'valid' : 'invalid'}',
        );
      }
    });
  }
}
