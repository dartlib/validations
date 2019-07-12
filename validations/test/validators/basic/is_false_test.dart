import 'package:validations/validators/basic.dart';

import '../../test_validator.dart';

void main() {
  TestValidator(IsFalseValidator())
    ..isValid({
      null,
      false,
    })
    ..isInvalid({
      true,
      '',
    });
}
