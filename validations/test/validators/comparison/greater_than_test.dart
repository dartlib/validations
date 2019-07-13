import 'package:validations/validators/comparison.dart';

import '../../test_validator.dart';

void main() {
  // ignore: missing_required_param
  TestValidator.throwsA<AssertionError>(() => GreaterThanValidator());

  TestValidator(GreaterThanValidator(value: 5))
    ..isValid({
      null,
      6,
    })
    ..isInvalid({
      '',
      true,
      false,
      4,
      5,
    });
}
