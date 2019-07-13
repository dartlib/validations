import 'package:validations/validators/comparison.dart';

import '../../test_validator.dart';

void main() {
  // ignore: missing_required_param
  TestValidator.throwsA<AssertionError>(() => EqualToValidator());

  final falseValues = [
    false,
    4,
    'B',
    1.0,
    Duration(days: 11),
  ];

  final values = [
    [
      2,
      2,
      falseValues,
    ],
    [
      'A',
      'A',
      falseValues,
    ],
    [
      true,
      true,
      falseValues,
    ],
    [
      3.0,
      3.0,
      falseValues,
    ],
    [
      Duration(days: 10),
      Duration(days: 10),
      falseValues,
    ],
  ];

  for (var value in values) {
    TestValidator(EqualToValidator(value: value.elementAt(0)))
      ..isValid({
        null,
        value.elementAt(1),
      })
      ..isInvalid(value.elementAt(2) as List);
  }
}
