import 'package:validations/validators/comparison.dart';

import '../../test_validator.dart';

void main() {
  // ignore: missing_required_param
  TestValidator.throwsA<AssertionError>(() => DecimalMaxValidator());

  TestValidator.throwsA<FormatException>(
    () => DecimalMaxValidator(value: 'A.B').validate('Q'),
  );

  TestValidator(DecimalMaxValidator(value: '6.0'))
    ..isValid({
      null,
      '5.0',
    })
    ..isInvalid({
      '6.0',
      '7.0',
    });

  TestValidator(DecimalMaxValidator(value: '6.0', inclusive: true))
    ..isValid({
      null,
      '5.0',
      '6.0',
    })
    ..isInvalid({
      '7.0',
    });
}
