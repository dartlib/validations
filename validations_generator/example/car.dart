import 'package:validations/validations.dart';

part 'car.gval.dart';

const daMessage = r'WORKS!!! There must be at least {value} seat(s)';

class Car {
  @NotNull()
  final String manufacturer;

  @Size(
    min: 2,
    max: 14,
    // message: r'The license plate \'${validatedValue}\' must be between {min} and {max} characters long'
  )
  @NotNull()
  final String licensePlate;

  @Min(
    value: 2,
    message: daMessage,
  )
  final int seatCount;

  @DecimalMax(
    value: '350',
    // message: 'The top speed ${formatter.format(r'%1$.2f', validatedValue)} is higher than {value}'
  )
  final double topSpeed;

  @DecimalMax(
    value: '100000',
    message: r'Price must not be higher than ${value}',
  )
  final double price;

  @AssertTrue(message: 'Car must be registered!')
  final bool isRegistered;

  const Car({
    this.manufacturer,
    this.licensePlate,
    this.seatCount,
    this.topSpeed,
    this.price,
    this.isRegistered,
  });
}

@GenValidator()
class CarValidator extends Validator<Car> with $_CarValidator {}
