import 'package:test/test.dart';
import 'package:validations/validators/basic.dart';

void main() {
  test('IsFalseValidator', () {
    expect(IsFalseValidator().validate(null), true);

    expect(IsFalseValidator().validate(false), true);
    expect(IsFalseValidator().validate(true), false);
    expect(IsFalseValidator().validate(''), false);
  });
}
