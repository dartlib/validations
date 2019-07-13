import 'package:validations/validators/string.dart';

import '../../test_validator.dart';

void main() {
  // https://github.com/dart-league/validators/blob/master/test/validator_test.dart
  TestValidator(HexadecimalValidator())
    ..isValid({
      null,
      'deadBEEF',
      'ff0044',
    })
    ..isInvalid({
      'abcdefg',
      ' ',
      '..',
    });
}
