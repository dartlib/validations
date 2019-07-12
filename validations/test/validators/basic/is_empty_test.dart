import 'package:test/test.dart';
import 'package:validations/validators/basic.dart';

void main() {
  test('IsEmptyValidator', () {
    expect(IsEmptyValidator().validate(null), true);

    expect(IsEmptyValidator().validate(''), true);
    expect(IsEmptyValidator().validate([]), true);
    expect(IsEmptyValidator().validate({}), true);
    expect(IsEmptyValidator().validate(<dynamic>{}), true);
  });
}
