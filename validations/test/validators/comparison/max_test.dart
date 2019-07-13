import 'package:validations/validators/comparison.dart';

import '../../test_validator.dart';

void main() {
  // ignore: missing_required_param
  TestValidator.throwsA<AssertionError>(() => MaxValidator());

  TestValidator(MaxValidator(value: 5))
    ..isValid({
      null,
      4,
      5,
    })
    ..isInvalid({
      '',
      true,
      false,
      6,
    });
}
