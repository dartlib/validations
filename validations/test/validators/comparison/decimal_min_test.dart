import 'package:validations/validators/comparison.dart';

import '../../test_validator.dart';

void main() {
  // ignore: missing_required_param
  TestValidator.throwsA<AssertionError>(() => DecimalMinValidator());

  TestValidator.throwsA<FormatException>(
    () => DecimalMinValidator(value: 'A.B').validate('Q'),
  );

  TestValidator(DecimalMinValidator(value: '6.0'))
    ..isValid({
      null,
      '7.0',
    })
    ..isInvalid({
      '5.0',
      '6.0',
    });

  TestValidator(DecimalMinValidator(value: '6.0', inclusive: true))
    ..isValid({
      null,
      '6.0',
      '7.0',
    })
    ..isInvalid({
      '5.0',
    });
}
