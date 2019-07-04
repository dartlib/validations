import 'package:decimal/decimal.dart';
import 'package:test/test.dart';

import 'models/car.dart';

void main() {
  group('TestCarValidator', () {
    TestCarValidator validator;
    setUp(() {
      validator = TestCarValidator();
    });

    group('validate()', () {
      test('Validates correctly configured car.', () {
        final car = Car();

        car.price = Decimal.parse('99.99');
        car.isRegistered = true;
        car.licensePlate = 'DY28-38';
        car.manufacturer = 'VEB Sachsenring';
        car.seatCount = 2;
        car.topSpeed = 100;

        expect(validator.validate(car), isEmpty);
      });

      test('Collects all violations.', () {
        final validator = TestCarValidator();

        final car = Car();

        car.price = Decimal.parse('100.99');
        car.isRegistered = false;
        car.licensePlate = 'D';
        car.manufacturer = null;
        car.seatCount = 3;
        car.topSpeed = 500;

        final violations = validator.validate(car);

        expect(
          violations.elementAt(0).message,
          equals('Value cannot be null'),
        );
        expect(
          violations.elementAt(1).message,
          equals(
              'The license plate D must be between 2 and 14 characters long'),
        );
        expect(
          violations.elementAt(2).message,
          equals('Car cannot have more than 2 seats'),
        );
        expect(
          violations.elementAt(3).message,
          equals('The top speed 500 is higher than 350'),
        );
        expect(
          violations.elementAt(4).message,
          equals('Price must not be lower than 100.00'),
        );
        expect(
          violations.elementAt(5).message,
          equals('Car must be registered!'),
        );
      });
    });

    group('validateProperty()', () {
      test('Validates single properties of correctly configured car.', () {
        final car = Car();

        car.price = Decimal.parse('99.99');
        car.isRegistered = true;
        car.licensePlate = 'DY28-38';
        car.manufacturer = 'VEB Sachsenring';
        car.seatCount = 2;
        car.topSpeed = 100;

        expect(validator.validateProperty(car, 'price'), isEmpty);
        expect(validator.validateProperty(car, 'isRegistered'), isEmpty);
        expect(validator.validateProperty(car, 'licensePlate'), isEmpty);
        expect(validator.validateProperty(car, 'manufacturer'), isEmpty);
        expect(validator.validateProperty(car, 'seatCount'), isEmpty);
        expect(validator.validateProperty(car, 'topSpeed'), isEmpty);
      });

      test('Collects violations per property.', () {
        final validator = TestCarValidator();

        final car = Car();

        car.price = Decimal.parse('100.99');
        car.isRegistered = false;
        car.licensePlate = 'D';
        car.manufacturer = null;
        car.seatCount = 3;
        car.topSpeed = 500;

        expect(
          validator.validateProperty(car, 'manufacturer').first.message,
          equals('Value cannot be null'),
        );
        expect(
          validator.validateProperty(car, 'licensePlate').first.message,
          equals(
              'The license plate D must be between 2 and 14 characters long'),
        );
        expect(
          validator.validateProperty(car, 'seatCount').first.message,
          equals('Car cannot have more than 2 seats'),
        );
        expect(
          validator.validateProperty(car, 'topSpeed').first.message,
          equals('The top speed 500 is higher than 350'),
        );
        expect(
          validator.validateProperty(car, 'price').first.message,
          equals('Price must not be lower than 100.00'),
        );
        expect(
          validator.validateProperty(car, 'isRegistered').first.message,
          equals('Car must be registered!'),
        );
      });
    });
  });
}
