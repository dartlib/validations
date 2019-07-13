import 'package:validations/validators/comparison.dart';

import '../../test_validator.dart';

void main() {
  // ignore: missing_required_param
  TestValidator.throwsA<AssertionError>(() => NotEqualToValidator());

  final notEqualValues = [
    null,
    false,
    3,
    'B',
    1.0,
    Duration(days: 11),
  ];

  final values = [
    [
      2,
      2,
      notEqualValues,
    ],
    [
      'A',
      'A',
      notEqualValues,
    ],
    [
      true,
      true,
      notEqualValues,
    ],
    [
      3.3,
      3.3,
      notEqualValues,
    ],
    [
      Duration(days: 10),
      Duration(days: 10),
      notEqualValues,
    ]
  ];

  for (var value in values) {
    TestValidator(NotEqualToValidator(value: value.elementAt(0)))
      ..isInvalid({
        value.elementAt(1),
      })
      ..isValid(value.elementAt(2) as List);
  }
}
