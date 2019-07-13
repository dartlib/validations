import 'package:decimal/decimal.dart';
import 'package:validations/validators/mixed.dart';

import '../../test_validator.dart';

void main() {
  TestValidator(DigitsValidator(integer: 5, fraction: 2))
    ..isValid({
      null,
      '500.2',
      Decimal.parse('-12345.12'),
      '-000000000.22',
    })
    ..isInvalid({
      Decimal.parse('-123456.12'),
      Decimal.parse('-123456.123'),
      Decimal.parse('-12345.123'),
      Decimal.parse('12345.123'),
      '256874',
      '12.0001',
    });

  TestValidator(DigitsValidator(integer: 0, fraction: 0))
    ..isValid({
      null,
    })
    ..isInvalid({
      '500.2',
    });

  TestValidator(DigitsValidator(integer: 12, fraction: 3))
    ..isValid({
      null,
      '0.001000',
      '0.010000',
    })
    ..isInvalid({
      '0.0101',
    });

  TestValidator.throwsA<ArgumentError>(
      () => DigitsValidator(integer: -1, fraction: 1));
  TestValidator.throwsA<ArgumentError>(
      () => DigitsValidator(integer: 1, fraction: -1));
}
