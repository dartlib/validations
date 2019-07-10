import 'package:test/test.dart';
import 'package:validations/validators/comparison.dart';

void main() {
  test('GreaterThanOrEqualValidator', () {
    expect(
      // ignore: missing_required_param
      () => GreaterThanOrEqualValidator(),
      throwsA(TypeMatcher<AssertionError>()),
    );
    var validator = GreaterThanOrEqualValidator(value: 5);

    expect(validator.validate(null), true);

    expect(validator.validate(''), false);
    expect(validator.validate(true), false);
    expect(validator.validate(false), false);
    expect(validator.validate(4), false);
    expect(validator.validate(5), true);
    expect(validator.validate(6), true);
  });
}
