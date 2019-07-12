import 'package:test/test.dart';
import 'package:validations/validators/basic.dart';

void main() {
  test('NotBlankValidator', () {
    expect(NotBlankValidator().validate(null), false);

    expect(NotBlankValidator().validate(''), false);
    expect(NotBlankValidator().validate('  '), false);
    expect(NotBlankValidator().validate('A'), true);
    expect(NotBlankValidator().validate(1), true);
    expect(NotBlankValidator().validate(true), true);
    expect(NotBlankValidator().validate(false), true);
  });
}
