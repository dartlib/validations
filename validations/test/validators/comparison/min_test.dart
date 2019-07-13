import 'package:validations/validators/comparison.dart';

import '../../test_validator.dart';

void main() {
  // ignore: missing_required_param
  TestValidator.throwsA<AssertionError>(() => MinValidator());

  TestValidator(MinValidator(value: 5))
    ..isValid({
      null,
      5,
      6,
    })
    ..isInvalid({
      '',
      true,
      false,
      4,
    });
}
