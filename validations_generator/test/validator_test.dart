import 'package:test/test.dart';
import 'package:validations/validations.dart';

void main() {
  group('Validators', () {
    setUp(() {});

    test('AssertFalse', () {
      expect(AssertFalseValidator().isValid(false), isTrue);
      expect(AssertFalseValidator().isValid(null), isFalse);
      expect(AssertFalseValidator().isValid(true), isFalse);
      expect(AssertFalseValidator().isValid(''), isFalse);
    });
  });
}
