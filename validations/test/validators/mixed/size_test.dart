import 'package:validations/validators/mixed.dart';

import '../../test_validator.dart';

void main() {
  TestValidator(SizeValidator(min: 2, max: 5))
    ..isValid({
      null,
      2,
      3,
      5,
      'AB',
      'ABC',
      'ABCDE',
    })
    ..isInvalid({
      1,
      6,
      'A',
      'ABCDEF',
    });
}
