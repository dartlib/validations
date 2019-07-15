import 'package:test/test.dart';
import 'package:validations/annotations.dart';

void main() {
  test('GenValidator', () {
    expect(
      () => const GenValidator(),
      returnsNormally,
    );
  });
}
