import 'package:test/test.dart';
import 'package:validations/validators/basic.dart';

void main() {
  test('Null', () {
    expect(NullValidator().validate(null), true);

    expect(NullValidator().validate(''), false);
    expect(NullValidator().validate(true), false);
    expect(NullValidator().validate(false), false);
    expect(NullValidator().validate(1), false);
  });
}
