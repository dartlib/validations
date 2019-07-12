import 'package:validations/validators/basic.dart';

import '../../test_validator.dart';

void main() {
  TestValidator(NotNullValidator())
    ..isValid({
      '',
      true,
      false,
      1,
    })
    ..isInvalid({
      null,
    });
}
