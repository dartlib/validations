import 'package:test/test.dart';
import 'package:validations/validators/basic.dart';

void main() {
  test('NotNullValidator', () {
    expect(NotNullValidator().validate(null), false);

    expect(NotNullValidator().validate(''), true);
    expect(NotNullValidator().validate(true), true);
    expect(NotNullValidator().validate(false), true);
    expect(NotNullValidator().validate(1), true);
  });
}
