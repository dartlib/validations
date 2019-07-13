import 'package:validations/validators/string.dart';

import '../../test_validator.dart';

void main() {
  // https://github.com/dart-league/validators/blob/master/test/validator_test.dart
  TestValidator(NumericValidator())
    ..isValid({
      null,
      '-1',
      '0',
      '00',
      '01',
      '19934',
      '-23412',
    })
    ..isInvalid({
      '',
      'abc!',
      'AB C',
    });
}
