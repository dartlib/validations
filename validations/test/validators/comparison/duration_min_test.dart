import 'package:validations/validators/comparison.dart';

import '../../test_validator.dart';

void main() {
  TestValidator(DurationMinValidator(days: 2))
    ..isValid({
      null,
      Duration(days: 3),
    })
    ..isInvalid({
      Duration(days: 0),
      Duration(days: 1),
      Duration(days: 2),
    });

  TestValidator(DurationMinValidator(days: 2, inclusive: true))
    ..isValid({
      null,
      Duration(days: 2),
      Duration(days: 3),
    })
    ..isInvalid({
      Duration(days: 0),
      Duration(days: 1),
    });
}
