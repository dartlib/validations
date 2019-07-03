import 'package:test/test.dart';

import 'models/all.dart';

void main() {
  group('Validators', () {
    setUp(() {});

    test('AssertFalse', () {
      final validator = TestValidator();

      final all = All();

      all.price = 100;
      all.isRegistered = true;
      all.licensePlate = 'DY28-38';
      all.manufacturer = 'VEB Sachsenring';
      all.seatCount = 2;
      all.topSpeed = 100;

      expect(validator.validate(all), isEmpty);
    });
  });
}
