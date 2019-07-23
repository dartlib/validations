import 'package:decimal/decimal.dart';
import 'package:intl/intl.dart';
import 'package:validations/validations.dart';

part 'car.g.dart';

class Driver {
  Driver({this.name});
  @NotNull()
  String name;
}

// TODO extents
// class Driver extends Person {}

class CarWithMixin extends Car with ValidatorMixin<TestCarValidator> {}

@FieldMatch(
  baseField: 'frontWheelCoverLeft',
  matchField: 'frontWheelCoverRight',
  baseFieldMessage: r'Left and Right front wheel covers should match!',
)
@FieldMatch(
  baseField: 'rearWheelCoverLeft',
  matchField: 'rearWheelCoverRight',
  matchFieldMessage: r'Left and Right rear wheel covers should match!',
)
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

  @NotEmpty()
  String frontWheelCoverLeft;
  @NotEmpty()
  String frontWheelCoverRight;
  @NotEmpty()
  String rearWheelCoverLeft;
  @NotEmpty()
  String rearWheelCoverRight;

  // Validations are declared in GenValidator
  Decimal price;

  // Validations are declared in GenValidator
  bool isRegistered;
}

@GenValidator(
  fields: {
    'price': [
      DecimalMax(
        value: '100.00',
        message: r'Price must not be higher than $value',
      ),
      DecimalMin(
        value: '49.99',
        message: r'Price must not be lower than $value',
      ),
    ],
    'isRegistered': [
      IsTrue(message: 'Car must be registered!'),
    ],
  },
)
class TestCarValidator extends Validator<Car> with _$TestCarValidator {}

@GenValidator()
class TestDriverValidator extends Validator<Driver> with _$TestDriverValidator {
}
