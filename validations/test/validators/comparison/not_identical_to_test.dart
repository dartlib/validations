import 'package:validations/validators/comparison.dart';

import '../../test_validator.dart';

void main() {
  // ignore: missing_required_param
  TestValidator.throwsA<AssertionError>(() => NotIdenticalToValidator());

  final trueValues = {false, 3, 'B', 1.0, Duration(days: 10)};

  final sameRef = Duration(days: 10);
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
      sameRef,
      sameRef,
      trueValues,
    }
  };

  for (var value in values) {
    TestValidator(NotIdenticalToValidator(value: value.elementAt(0)))
      ..isInvalid({
        null,
        value.elementAt(1),
      })
      ..isValid(value.elementAt(2) as Set);
  }
}
