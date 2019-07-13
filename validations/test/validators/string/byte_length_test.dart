import 'package:validations/validators/string.dart';

import '../../test_validator.dart';

void main() {
  // ignore: missing_required_param
  TestValidator.throwsA<AssertionError>(() => ByteLengthValidator());

  // https://github.com/dart-league/validators/blob/master/test/validator_test.dart
  TestValidator(ByteLengthValidator(min: 2))
    ..isValid({
      null,
      'abc',
      'de',
    })
    ..isInvalid({
      '',
      ' ',
    });

  TestValidator(ByteLengthValidator(min: 2, max: 3))
    ..isValid({
      null,
      'abc',
      'de',
      '干𩸽',
    })
    ..isInvalid({
      '',
      'abcdef',
    });
}
