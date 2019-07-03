import 'package:decimal/decimal.dart';
import 'package:test/test.dart';

import 'models/car.dart';

void main() {
  group('TestCarValidator', () {
    setUp(() {});

    test('Validates correctly configured car.', () {
      final validator = TestCarValidator();

      final car = Car();

      car.price = Decimal.parse('99.99');
      car.isRegistered = true;
      car.licensePlate = 'DY28-38';
      car.manufacturer = 'VEB Sachsenring';
      car.seatCount = 2;
      car.topSpeed = 100;

      expect(validator.validate(car), isEmpty);
    });

    try {
      test('Collects all misconfigurations.', () {
        final validator = TestCarValidator();

        final car = Car();

        car.price = Decimal.parse('100.99');
        car.isRegistered = false;
        car.licensePlate = 'D';
        car.manufacturer = null;
        car.seatCount = 3;
        car.topSpeed = 500;

        final errors = validator.validate(car);

        // Problem now is what to do with optional parameters
        // and passing their values to the message

        errors.forEach((error) => print(error));

        expect(errors, isEmpty);
      });
    } catch (e, s) {
      print(s);
    }
  });
}
