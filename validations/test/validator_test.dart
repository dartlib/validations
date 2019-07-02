import 'package:test/test.dart';
import 'package:validations/validations.dart';

void main() {
  group('Validators', () {
    setUp(() {});

    test('NotNull', () {
      expect(NotNullValidator(null).validate(), isFalse);
      expect(NotNullValidator('').validate(), isTrue);
    });
  });
}
