import 'package:validations/validators/comparison.dart';

import '../../test_validator.dart';

void main() {
  // ignore: missing_required_param
  TestValidator.throwsA<AssertionError>(() => IdenticalToValidator());

  final falseValues = [
    false,
    3,
    'B',
    1.0,
    Duration(days: 10),
  ];

  final sameRef = Duration(days: 10);
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
      sameRef,
      sameRef,
      falseValues,
    ],
  ];

  for (var value in values) {
    TestValidator(IdenticalToValidator(value: value.elementAt(0)))
      ..isValid({
        null,
        value.elementAt(1),
      })
      ..isInvalid(value.elementAt(2) as List);
  }
}
