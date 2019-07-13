import 'package:validations/validators/date.dart';

import '../../test_validator.dart';

void main() {
  // https://github.com/dart-league/validators/blob/master/test/validator_test.dart
  TestValidator(BeforeValidator(
    year: 2005,
    month: 12,
    day: 12,
  ))
    ..isValid({
      null,
      '2002-12-12',
      '2002-02-27 13:27:00',
      '2002-02-27T14:00:00-0500',
    })
    ..isInvalid({
      '2012-12-12',
      '2012-02-27 13:27:00',
      '2022-02-27T14:00:00-0500',
      ' ',
      '',
    });

  TestValidator(BeforeValidator())
    ..isValid({
      null,
      '2002-12-12',
      '2002-02-27 13:27:00',
      '2002-02-27T14:00:00-0500',
    })
    ..isInvalid({
      '2022-12-12',
      '2022-02-27 13:27:00',
      '2022-02-27T14:00:00-0500',
      ' ',
      ''
    });
}
