import 'package:validations/validations.dart';

part 'all.gval.dart';

class All {
  @NotNull()
  final String manufacturer;

  @Size(
    min: 2,
    max: 14,
    message:
        r'The license plate ${validatedValue} must be between ${min} and ${max} characters long',
  )
  @NotNull()
  final String licensePlate;

  @Min(
    value: 2,
  )
  final int seatCount;

  @DecimalMax(
    value: '350',
    message: r'The top speed ${validatedValue} is higher than ${value}',
  )
  final double topSpeed;

  @DecimalMax(
    value: '100000',
    message: r'Price must not be higher than ${value}',
  )
  final double price;

  @AssertTrue(message: 'All must be registered!')
  final bool isRegistered;

  const All({
    this.manufacturer,
    this.licensePlate,
    this.seatCount,
    this.topSpeed,
    this.price,
    this.isRegistered,
  });
}

@GenValidator()
class AllValidator extends Validator<All> with $_AllValidator {}
