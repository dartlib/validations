import 'package:validations/validators/basic.dart';

import '../../test_validator.dart';

void main() {
  TestValidator(NullValidator())
    ..isValid({
      null,
    })
    ..isInvalid({
      '',
      true,
      false,
      1,
    });
}
