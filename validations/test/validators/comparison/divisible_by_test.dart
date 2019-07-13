import 'package:validations/validators/string.dart';

import '../../test_validator.dart';

void main() {
  TestValidator(AValidator())
    ..isValid({
      null,
    })
    ..isInvalid({
    });
