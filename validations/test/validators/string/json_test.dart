import 'package:validations/validators/string.dart';

import '../../test_validator.dart';

void main() {
  // https://github.com/dart-league/validators/blob/master/test/validator_test.dart
  TestValidator(JsonValidator())
    ..isValid({
      null,
      '{"key": "v"}',
      '{"1": [1, 2, 3]}',
      '[1, 2, 3]',
    })
    ..isInvalid({
      'foo',
      '{ key: "value" }',
      '{ \'key\': \'value\' }',
    });
}
