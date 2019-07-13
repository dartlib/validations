import 'package:validations/validators/comparison.dart';

import '../../test_validator.dart';

void main() {
  TestValidator(DurationMaxValidator(days: 2))
    ..isValid({
      null,
      Duration(days: 0),
      Duration(days: 1),
    })
    ..isInvalid({
      Duration(days: 2),
    });

  TestValidator(DurationMaxValidator(days: 2, inclusive: true))
    ..isValid({
      null,
      Duration(days: 0),
      Duration(days: 1),
      Duration(days: 2),
    })
    ..isInvalid({
      Duration(days: 3),
    });
}
