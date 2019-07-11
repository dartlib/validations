import 'package:test/test.dart';
import 'package:validations/validators/string.dart';

void main() {
  test('EmailValidator', () {
    expect(EmailValidator().validate(null), true);

    expect(EmailValidator().validate('test@test.com'), true);
    expect(EmailValidator().validate('test.com'), false);
    expect(EmailValidator().validate('test'), false);
  });
}
