import 'package:validations/validators/number.dart';

import '../../test_validator.dart';

void main() {
  TestValidator(AValidator())
    ..isValid({
      null,
    })
    ..isInvalid({
    });
