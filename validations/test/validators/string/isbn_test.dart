import 'package:validations/validators/string.dart';

import '../../test_validator.dart';

void main() {
  // https://github.com/dart-league/validators/blob/master/test/validator_test.dart
  const valid10 = {
    '3836221195',
    '3-8362-2119-5',
    '3 8362 2119 5',
    '1617290858',
    '1-61729-085-8',
    '1 61729 085-8',
    '0007269706',
    '0-00-726970-6',
    '0 00 726970 6',
    '3423214120',
    '3-423-21412-0',
    '3 423 21412 0',
    '340101319X',
    '3-401-01319-X',
    '3 401 01319 X',
  };

  const invalid10 = {
    '3423214121',
    '3-423-21412-1',
    '3 423 21412 1',
    '978-3836221191',
    '9783836221191',
    '123456789a',
    'foo',
    '',
  };

  const valid13 = {
    '9783836221191',
    '978-3-8362-2119-1',
    '978 3 8362 2119 1',
    '9783401013190',
    '978-3401013190',
    '978 3401013190',
    '9784873113685',
    '978-4-87311-368-5',
    '978 4 87311 368 5',
  };

  const invalid13 = {
    '9783836221190',
    '978-3-8362-2119-0',
    '978 3 8362 2119 0',
    '3836221195',
    '3-8362-2119-5',
    '3 8362 2119 5',
    '01234567890ab',
    'foo',
    ''
  };

  TestValidator(ISBNValidator(version: 10))
    ..isValid(valid10)
    ..isInvalid(invalid10, 'Version 10');

  TestValidator(ISBNValidator(version: 13))
    ..isValid(valid13)
    ..isInvalid(invalid13, 'Version 13');

  TestValidator(ISBNValidator())
    ..isValid(Set.from(valid10)..addAll(valid13))
    ..isInvalid({
      '3423214121',
      '9783836221190'
          '01234567890ab',
      'foo',
      ''
    }, 'All Versions');
}
