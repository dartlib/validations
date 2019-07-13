import 'package:validations/validators/string.dart';

import '../../test_validator.dart';

void main() {
  // https://github.com/dart-league/validators/blob/master/test/validator_test.dart
  TestValidator(AsciiValidator())
    ..isValid({
      null,
      'abc',
      '<>@" *.',
    })
    ..isInvalid({
      'ひらがな・カタカナ、．漢字',
      'あいうえお foobar',
      'test＠example.com',
      '1234abcDEｘｙｚ',
    });
}
