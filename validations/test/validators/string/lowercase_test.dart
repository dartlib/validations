import 'package:validations/validators/string.dart';

import '../../test_validator.dart';

void main() {
  // https://github.com/dart-league/validators/blob/master/test/validator_test.dart
  TestValidator(LowercaseValidator())
    ..isValid({
      null,
      'abc',
      'abc123',
      'l.o.w.e.r.',
      'tr竪s 端ber',
    })
    ..isInvalid({
      'f00Bar',
      'uUu',
    });
}
