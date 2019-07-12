import 'package:test/test.dart';
import 'package:validations/validators/basic.dart';

void main() {
  test('NotEmptyValidator', () {
    expect(NotEmptyValidator().validate(null), false);

    expect(NotEmptyValidator().validate(''), false);
    expect(NotEmptyValidator().validate([]), false);
    expect(NotEmptyValidator().validate({}), false);
    expect(NotEmptyValidator().validate(<dynamic>{}), false);

    expect(NotEmptyValidator().validate('a'), true);
    expect(NotEmptyValidator().validate({'a'}), true);
    expect(NotEmptyValidator().validate([1]), true);
    expect(NotEmptyValidator().validate({'a': 'b'}), true);
  });
}
