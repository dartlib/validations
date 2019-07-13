import 'package:validations/validators/comparison.dart';

import '../../test_validator.dart';

void main() {
  // ignore: missing_required_param
  TestValidator.throwsA<AssertionError>(() => LessThanValidator());

  TestValidator(LessThanValidator(value: 5))
    ..isValid({
      null,
      4,
    })
    ..isInvalid({
      '',
      true,
      false,
      5,
      6,
    });
}
