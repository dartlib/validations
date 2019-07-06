// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car.dart';

// **************************************************************************
// ValidatorGenerator
// **************************************************************************

abstract class $_TestCarValidator implements Validator<Car> {
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
  Map<String, List<ConstraintValidator>> getConstraintValidators() {
    return {
      'manufacturer': [NotNullValidator()],
      'driver': [
        ValidValidator(
          TestDriverValidator()..validationContext = validationContext,
        )..message = driverValidMessage
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

  validateManufacturer(Object value) => validateValue('manufacturer', value);
  validateDriver(Object value) => validateValue('driver', value);
  validateLicensePlate(Object value) => validateValue('licensePlate', value);
  validateSeatCount(Object value) => validateValue('seatCount', value);
  validateTopSpeed(Object value) => validateValue('topSpeed', value);
  validatePrice(Object value) => validateValue('price', value);
  validateIsRegistered(Object value) => validateValue('isRegistered', value);
}

abstract class $_TestDriverValidator implements Validator<Driver> {
  Map<String, List<ConstraintValidator>> getConstraintValidators() {
    return {
      'name': [NotNullValidator()]
    };
  }

  Map<String, dynamic> props(Driver instance) {
    return {'name': instance.name};
  }

  validateName(Object value) => validateValue('name', value);
}
