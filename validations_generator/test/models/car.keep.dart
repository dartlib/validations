// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car.dart';

// **************************************************************************
// ValidatorGenerator
// **************************************************************************

abstract class $_TestCarValidator implements Validator<Car> {
  Map<String, List<ConstraintValidator>> getValidators() {
    return {
      'manufacturer': [NotNullValidator()],
      'driver': [
        ValidValidator(
            TestDriverValidator()..validationContext = validationContext)
          ..message = driverValidMessage
      ],
      'licensePlate': [
        SizeValidator(min: 2, max: 14)..message = licensePlateSizeMessage,
        NotNullValidator()
      ],
      'seatCount': [
        MinValidator(value: 1)..message = seatCountMinMessage,
        MaxValidator(value: 2)..message = seatCountMaxMessage
      ],
      'topSpeed': [MaxValidator(value: 350)..message = topSpeedMaxMessage],
      'price': [
        DecimalMaxValidator(inclusive: true, value: '100.00')
          ..message = priceDecimalMaxMessage,
        DecimalMinValidator(inclusive: true, value: '49.99')
          ..message = priceDecimalMinMessage
      ],
      'isRegistered': [
        AssertTrueValidator()..message = isRegisteredAssertTrueMessage
      ]
    };
  }

  static driverValidMessage(Object validatedValue) =>
      'There should be a valid driver!';
  static licensePlateSizeMessage(int min, int max, Object validatedValue) =>
      'The license plate ${validatedValue} must be between ${min} and ${max} characters long';
  static seatCountMinMessage(num value, Object validatedValue) =>
      'Car must at least have ${value} seats available';
  static seatCountMaxMessage(num value, Object validatedValue) =>
      'Car cannot have more than ${value} seats';
  static topSpeedMaxMessage(num value, Object validatedValue) =>
      'The top speed ${validatedValue} is higher than ${value}';
  static priceDecimalMaxMessage(
          String value, bool inclusive, Object validatedValue) =>
      'Price must not be lower than ${value}';
  static priceDecimalMinMessage(
          String value, bool inclusive, Object validatedValue) =>
      'Price must not be higher than ${value}';
  static isRegisteredAssertTrueMessage(Object validatedValue) =>
      'Car must be registered!';
  Map<String, dynamic> props(Car instance) {
    return {
      'manufacturer': instance.manufacturer,
      'driver': instance.driver,
      'licensePlate': instance.licensePlate,
      'seatCount': instance.seatCount,
      'topSpeed': instance.topSpeed,
      'price': instance.price,
      'isRegistered': instance.isRegistered
    };
  }
}

abstract class $_TestDriverValidator implements Validator<Driver> {
  final Map<String, List<ConstraintValidator>> validators = {
    'name': [NotNullValidator()]
  };

  Map<String, dynamic> props(Driver instance) {
    return {'name': instance.name};
  }
}
