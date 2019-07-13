import 'package:validations/validators/number.dart';

import '../../test_validator.dart';

void main() {
  TestValidator(PositiveOrZeroValidator())
    ..isValid({
      null,
      1,
      0,
    })
    ..isInvalid({
      -1,
    });
}
