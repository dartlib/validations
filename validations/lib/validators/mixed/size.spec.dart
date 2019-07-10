import 'package:test/test.dart';
import 'package:validations/validators/mixed.dart';

void main() {
  SizeValidator validator;
  setUp(() {
    validator = SizeValidator(min: 2, max: 5);
  });

  group('SizeValidator', () {
    test('allow null', () {
      expect(validator.validate(null), true);
    });

    test('validate number', () {
      expect(validator.validate(1), false);

      expect(validator.validate(2), true);
      expect(validator.validate(3), true);
      expect(validator.validate(5), true);

      expect(validator.validate(6), false);
    });

    test('validate string', () {
      expect(validator.validate('A'), false);

      expect(validator.validate('AB'), true);
      expect(validator.validate('ABC'), true);
      expect(validator.validate('ABCDE'), true);

      expect(validator.validate('ABCDEF'), false);
    });
  });
}
