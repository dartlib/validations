import 'package:validations/validators/string.dart';

import '../../test_validator.dart';

void main() {
  // https://github.com/dart-league/validators/blob/master/test/validator_test.dart
  TestValidator(AlphaValidator())
    ..isValid({
      null,
      'abc1',
      '0A1BC',
      '0A1bC',
    })
    ..isInvalid({
      'abc!',
      'AB C',
      '',
    });
}
