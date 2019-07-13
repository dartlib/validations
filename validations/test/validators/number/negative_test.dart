import 'package:validations/validators/number.dart';

import '../../test_validator.dart';

void main() {
  TestValidator(NegativeValidator())
    ..isValid({
      null,
      -1,
    })
    ..isInvalid({
      0,
      1,
    });
}
