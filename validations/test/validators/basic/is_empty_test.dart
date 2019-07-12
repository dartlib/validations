import 'package:validations/validators/basic.dart';

import '../../test_validator.dart';

void main() {
  TestValidator(IsEmptyValidator())
    ..isValid({
      null,
      '',
      [],
      {},
      <dynamic>{},
    })
    ..isInvalid({
      'A',
      [1],
      {'A': 'A'},
      {'A'},
    });
}
