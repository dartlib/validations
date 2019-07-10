import 'package:test/test.dart';
import 'package:validations/validators/string.dart';

void main() {
  test('ISBNValidator', () {
    expect(ISBNValidator().validate(null), true);

    expect(ISBNValidator().validate('978-3-16-148410-0'), true);
    expect(ISBNValidator().validate('1234'), false);
  });
}
