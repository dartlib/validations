import 'package:test/test.dart';
import 'package:validations/validators/basic.dart';

void main() {
  test('BlankValidator', () {
    expect(BlankValidator().validate(null), true);

    expect(BlankValidator().validate(''), true);
    expect(BlankValidator().validate(' '), false);
    expect(BlankValidator().validate('A'), false);
    expect(BlankValidator().validate(1), false);
    expect(BlankValidator().validate(true), false);
  });
}
