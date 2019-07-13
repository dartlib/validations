import 'package:validations/validators/string.dart';

import '../../test_validator.dart';

void main() {
  // https://github.com/dart-league/validators/blob/master/test/validator_test.dart
  TestValidator(HexColorValidator())
    ..isValid({
      null,
      '#ff0034',
      '#CCCCCC',
      'fff',
      '#f00',
    })
    ..isInvalid({
      '#ff',
      'fff0',
      '#ff12FG',
    });
}
