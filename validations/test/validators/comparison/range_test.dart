import 'package:validations/validators/comparison.dart';

import '../../test_validator.dart';

void main() {
  // ignore: missing_required_param
  TestValidator.throwsA<AssertionError>(() => RangeValidator());
  // ignore: missing_required_param
  TestValidator.throwsA<AssertionError>(() => RangeValidator(min: 1));
  // ignore: missing_required_param
  TestValidator.throwsA<AssertionError>(() => RangeValidator(max: 1));

  TestValidator(RangeValidator(min: 2, max: 5))
    ..isValid({
      null,
      2,
      5,
      'AA',
      'AAAAA',
    })
    ..isInvalid({
      1,
      6,
      'A',
      'AAAAAA',
    });
}
