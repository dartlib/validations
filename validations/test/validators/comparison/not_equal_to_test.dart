import 'package:validations/validators/comparison.dart';

import '../../test_validator.dart';

void main() {
  // ignore: missing_required_param
  TestValidator.throwsA<AssertionError>(() => NotEqualToValidator());

  final trueValues = {false, 3, 'B', 1.0, Duration(days: 11)};
  final values = {
    {
      2,
      2,
      trueValues,
    },
    {
      'A',
      'A',
      trueValues,
    },
    {
      true,
      true,
      trueValues,
    },
    {
      3.0,
      3.0,
      trueValues,
    },
    {
      Duration(days: 10),
      Duration(days: 10),
      trueValues,
    }
  };

  for (var value in values) {
    TestValidator(NotEqualToValidator(value: value.elementAt(0)))
      ..isInvalid({
        null,
        value.elementAt(1),
      })
      ..isValid(value.elementAt(2) as Set);
  }
}
