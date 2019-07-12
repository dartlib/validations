import 'package:validations/validators/basic.dart';

import '../../test_validator.dart';

void main() {
  TestValidator(NotEmptyValidator())
    ..isValid({
      'a',
      {'a'},
      [1],
      {'a': 'a'},
    })
    ..isInvalid({
      null,
      '',
      [],
      {},
      <dynamic>{},
    });
}
