import 'package:validations/validators/string.dart';

import '../../test_validator.dart';

void main() {
  // https://github.com/dart-league/validators/blob/master/test/validator_test.dart
  TestValidator(AlphaValidator())
    ..isValid({
      null,
      'abc',
      'ABC',
      'AbC',
    })
    ..isInvalid({
      'abc1',
      'AB C',
      '',
    });
}
