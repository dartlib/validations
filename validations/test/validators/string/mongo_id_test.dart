import 'package:validations/validators/string.dart';

import '../../test_validator.dart';

void main() {
  // https://github.com/dart-league/validators/blob/master/test/validator_test.dart
  TestValidator(MongoIdValidator())
    ..isValid({
      null,
      '507f1f77bcf86cd799439011',
    })
    ..isInvalid({
      '',
      '507f1f77bcf86cd7994390',
      '507f1f77bcf86cd7994390z',
    });
}
