import 'package:test/test.dart';

void main() {
  test('TypeValidator', () {
    /* Solved at the FieldValidator level now.
    expect(TypeValidator(type: num).validate(1), true);
    expect(TypeValidator(type: num).validate(1.0), true);
    expect(TypeValidator(type: Duration).validate(Duration()), true);
    expect(TypeValidator(type: Duration).validate(num), false);
    expect(TypeValidator(type: String).validate(''), true);
    expect(TypeValidator(type: String).validate(1), false);
    expect(TypeValidator(type: bool).validate(true), true);
    expect(TypeValidator(type: bool).validate(false), true);
    */
  });
}
