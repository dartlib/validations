import 'package:validations/validators/string.dart';

import '../../test_validator.dart';

void main() {
  // https://github.com/dart-league/validators/blob/master/test/validator_test.dart
  TestValidator(UppercaseValidator())
    ..isValid({
      null,
      'ABC',
      'ABC123',
      'U.P.P.E.R.',
    })
    ..isInvalid({
      'f00Bar',
      'uUu',
    });
}
