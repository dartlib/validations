import 'package:validations/validators/basic.dart';

import '../../test_validator.dart';

void main() {
  TestValidator(NotBlankValidator())
    ..isValid({
      'A',
      1,
      true,
      false,
    })
    ..isInvalid({
      null,
      '',
      ' ',
    });
}
