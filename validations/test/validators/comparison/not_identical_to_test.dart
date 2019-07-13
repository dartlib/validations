import 'package:validations/validators/comparison.dart';

import '../../test_validator.dart';

void main() {
  TestValidator(AValidator())
    ..isValid({
      null,
    })
    ..isInvalid({
    });
