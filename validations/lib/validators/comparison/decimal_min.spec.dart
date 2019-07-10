import 'package:test/test.dart';
import 'package:validations/validators/comparison.dart';

void main() {
  test('DecimalMinValidator', () {
    expect(DecimalMinValidator(value: '5.0').validate(null), true);

    expect(
      // ignore: missing_required_param
      () => DecimalMinValidator(),
      throwsA(TypeMatcher<AssertionError>()),
    );
    expect(DecimalMinValidator(value: '5.0').validate('6.0'), true);
    expect(DecimalMinValidator(value: '6.0').validate('5.0'), false);
    expect(DecimalMinValidator(value: '6.0').validate('5.0'), false);
    expect(
      DecimalMinValidator(value: '5.0', inclusive: true).validate('5.0'),
      true,
    );
    expect(
      () => DecimalMinValidator(value: 'A.B').validate('Q'),
      throwsA(
        TypeMatcher<FormatException>(),
      ),
    );
  });
}
