import 'package:validations/validators/basic.dart';

import '../../test_validator.dart';

void main() {
  TestValidator(BlankValidator())
    ..isValid({
      null,
      '',
    })
    ..isInvalid({
      ' ',
      'A',
      1,
      true,
    });
}
