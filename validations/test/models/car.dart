import 'package:decimal/decimal.dart';
import 'package:intl/intl.dart';
import 'package:validations/validations.dart';

part 'car.gval.dart';

class Driver {
  Driver({this.name});
  @NotNull()
  String name;
}

// TODO extents
// class Driver extends Person {}

class CarWithMixin extends Car with ValidatorMixin<TestCarValidator> {}

class Car {
  @NotNull()
  String manufacturer;

  @Valid(message: 'There should be a valid driver!')
  Driver driver;

  @Size(
    min: 2,
    max: 14,
    message:
        r'The license plate $validatedValue must be between $min and $max characters long',
  )
  @NotNull()
  String licensePlate;

  @Min(
    value: 1,
    message: r'Car must at least have $value seats available',
  )
  @Max(
    value: 2,
    message: r'Car cannot have more than $value seats',
  )
  int seatCount;

  @Max(
    value: 350,
    message: r'The top speed $validatedValue is higher than $value',
  )
  int topSpeed;

  @DecimalMax(
    value: '100.00',
    message: r'Price must not be higher than $value',
  )
  @DecimalMin(
    value: '49.99',
    message: r'Price must not be lower than $value',
  )
  Decimal price;

  @IsTrue(message: 'Car must be registered!')
  bool isRegistered;
}

@GenValidator()
class TestCarValidator extends Validator<Car> with $_TestCarValidator {}

@GenValidator()
class TestDriverValidator extends Validator<Driver> with $_TestDriverValidator {
}
