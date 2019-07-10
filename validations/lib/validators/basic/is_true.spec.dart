import 'package:test/test.dart';
import 'package:validations/validators/basic.dart';

void main() {
  test('IsTrueValidator', () {
    expect(IsTrueValidator().validate(null), false);

    expect(IsTrueValidator().validate(true), true);
    expect(IsTrueValidator().validate(false), false);
    expect(IsTrueValidator().validate(''), false);
  });
}
