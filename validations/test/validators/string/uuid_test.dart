import 'package:validations/validators/string.dart';

import '../../test_validator.dart';

void main() {
  // https://github.com/dart-league/validators/blob/master/test/validator_test.dart
  TestValidator(UuidValidator())
    ..isValid({
      null,
      'A987FBC9-4BED-3078-CF07-9141BA07C9F3',
      'A987FBC9-4BED-4078-8F07-9141BA07C9F3',
      'A987FBC9-4BED-5078-AF07-9141BA07C9F3',
    })
    ..isInvalid({
      '',
      'xxxA987FBC9-4BED-3078-CF07-9141BA07C9F3',
      'A987FBC9-4BED-3078-CF07-9141BA07C9F3xxx',
      'A987FBC94BED3078CF079141BA07C9F3',
      '934859',
      '987FBC9-4BED-3078-CF07A-9141BA07C9F3',
      'AAAAAAAA-1111-1111-AAAG-111111111111',
    });

  TestValidator(UuidValidator(version: 4))
    ..isValid({
      null,
      '713ae7e3-cb32-45f9-adcb-7c4fa86b90c1',
      '625e63f3-58f5-40b7-83a1-a72ad31acffb',
      '57b73598-8764-4ad0-a76a-679bb6640eb1',
    })
    ..isInvalid({
      '',
      'xxxA987FBC9-4BED-3078-CF07-9141BA07C9F3',
      'A987FBC9-4BED-3078-CF07-9141BA07C9F3xxx',
      'A987FBC94BED3078CF079141BA07C9F3',
      '934859',
      '987FBC9-4BED-3078-CF07A-9141BA07C9F3',
      'AAAAAAAA-1111-1111-AAAG-111111111111',
    });

  TestValidator(UuidValidator(version: 5))
    ..isValid({
      null,
      '987FBC97-4BED-5078-AF07-9141BA07C9F3',
      '987FBC97-4BED-5078-BF07-9141BA07C9F3',
      '987FBC97-4BED-5078-8F07-9141BA07C9F3',
    })
    ..isInvalid({
      '',
      'xxxA987FBC9-4BED-3078-CF07-9141BA07C9F3',
      'A987FBC9-4BED-3078-CF07-9141BA07C9F3xxx',
      'A987FBC94BED3078CF079141BA07C9F3',
      '934859',
      '987FBC9-4BED-3078-CF07A-9141BA07C9F3',
      'AAAAAAAA-1111-1111-AAAG-111111111111'
    });
}
