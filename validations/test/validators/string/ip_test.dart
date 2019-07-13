import 'package:validations/validators/string.dart';

import '../../test_validator.dart';

void main() {
  // https://github.com/dart-league/validators/blob/master/test/validator_test.dart
  TestValidator(IpValidator())
    ..isValid({
      null,
      '127.0.0.1',
      '0.0.0.0',
      '255.255.255.255',
      '1.2.3.4',
      '::1',
      '2001:db8:0000:1:1:1:1:1',
    })
    ..isInvalid({
      'abc',
      '256.0.0.0',
      '0.0.0.256',
      '26.0.0.256',
    });

  TestValidator(IpValidator(version: 4))
    ..isValid({
      null,
      '127.0.0.1',
      '0.0.0.0',
      '255.255.255.255',
      '1.2.3.4',
    })
    ..isInvalid({
      'abc',
      '256.0.0.0',
      '0.0.0.256',
      '26.0.0.256',
      '::1',
      '2001:db8:0000:1:1:1:1:1',
    });

  TestValidator(IpValidator(version: 6))
    ..isValid({
      null,
      '::1',
      '2001:db8:0000:1:1:1:1:1',
    })
    ..isInvalid({
      'abc',
      '256.0.0.0',
      '0.0.0.256',
      '26.0.0.256',
      '127.0.0.1',
      '0.0.0.0',
      '255.255.255.255',
      '1.2.3.4',
    });
}
