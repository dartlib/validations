import 'package:test/test.dart';
import 'package:validations/validators/comparison.dart';

void main() {
  test('LessThanOrEqualValidator', () {
    expect(
      // ignore: missing_required_param
      () => LessThanOrEqualValidator(),
      throwsA(TypeMatcher<AssertionError>()),
    );

    var validator = LessThanOrEqualValidator(value: 5);

    expect(validator.validate(null), true);

    expect(validator.validate(''), false);
    expect(validator.validate(true), false);
    expect(validator.validate(false), false);
    expect(validator.validate(4), true);
    expect(validator.validate(5), true);
  });
}
