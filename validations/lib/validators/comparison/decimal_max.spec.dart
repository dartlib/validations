import 'package:test/test.dart';
import 'package:validations/validators/comparison.dart';

void main() {
  test('DecimalMaxValidator', () {
    expect(DecimalMaxValidator(value: '6.0').validate(null), true);

    expect(
      // ignore: missing_required_param
      () => DecimalMaxValidator(),
      throwsA(TypeMatcher<AssertionError>()),
    );
    expect(DecimalMaxValidator(value: '6.0').validate('5.0'), true);
    expect(DecimalMaxValidator(value: '5.0').validate('6.0'), false);
    expect(DecimalMaxValidator(value: '5.0').validate('5.0'), false);
    expect(
      DecimalMaxValidator(value: '5.0', inclusive: true).validate('5.0'),
      true,
    );
    expect(
      () => DecimalMaxValidator(value: 'A.B').validate('Q'),
      throwsA(
        TypeMatcher<FormatException>(),
      ),
    );
  });
}
