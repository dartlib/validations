import 'package:validations/validators/comparison.dart';

import '../../test_validator.dart';

void main() {
  // ignore: missing_required_param
  TestValidator.throwsA<AssertionError>(() => DivisibleByValidator());

  TestValidator(DivisibleByValidator(value: 3))
    ..isValid({
      null,
      3,
      6,
    })
    ..isInvalid({
      2,
      7,
    });
}
