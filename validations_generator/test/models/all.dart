import 'package:validations/validations.dart';

part 'all.gval.dart';

class All {
  @NotNull()
  String manufacturer;

  @Size(
    min: 2,
    max: 14,
    message:
        r'The license plate ${validatedValue} must be between ${min} and ${max} characters long',
  )
  @NotNull()
  String licensePlate;

  @Min(
    value: 2,
  )
  int seatCount;

  @DecimalMax(
    value: '350',
    message: r'The top speed ${validatedValue} is higher than ${value}',
  )
  double topSpeed;

  @DecimalMax(
    value: '100000',
    message: r'Price must not be higher than ${value}',
  )
  double price;

  @AssertTrue(message: 'All must be registered!')
  bool isRegistered;
}

@GenValidator()
class TestValidator extends Validator<All> with $_TestValidator {}
