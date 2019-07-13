import 'package:validations/validators/string.dart';

import '../../test_validator.dart';

void main() {
  // https://github.com/dart-league/validators/blob/master/test/validator_test.dart
  TestValidator(FqdnValidator())
    ..isValid({
      null,
    })
    ..isInvalid({});
}
