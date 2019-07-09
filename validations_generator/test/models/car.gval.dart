// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car.dart';

// **************************************************************************
// ValidatorGenerator
// **************************************************************************

abstract class $_TestCarValidator implements Validator<Car> {
  static String driverValidMessage(Object validatedValue) =>
      Intl.message('There should be a valid driver!',
          name: 'driverValidMessage', args: [validatedValue]);
  static String licensePlateSizeMessage(
          int min, int max, Object validatedValue) =>
      Intl.message(
          'The license plate $validatedValue must be between $min and $max characters long',
          name: 'licensePlateSizeMessage',
          args: [min, max, validatedValue]);
  static String seatCountMinMessage(num value, Object validatedValue) =>
      Intl.message('Car must at least have $value seats available',
          name: 'seatCountMinMessage', args: [value, validatedValue]);
  static String seatCountMaxMessage(num value, Object validatedValue) =>
      Intl.message('Car cannot have more than $value seats',
          name: 'seatCountMaxMessage', args: [value, validatedValue]);
  static String topSpeedMaxMessage(num value, Object validatedValue) =>
      Intl.message('The top speed $validatedValue is higher than $value',
          name: 'topSpeedMaxMessage', args: [value, validatedValue]);
  static String priceDecimalMaxMessage(
          String value, bool inclusive, Object validatedValue) =>
      Intl.message('Price must not be lower than $value',
          name: 'priceDecimalMaxMessage',
          args: [value, inclusive, validatedValue]);
  static String priceDecimalMinMessage(
          String value, bool inclusive, Object validatedValue) =>
      Intl.message('Price must not be higher than $value',
          name: 'priceDecimalMinMessage',
          args: [value, inclusive, validatedValue]);
  static String isRegisteredAssertTrueMessage(Object validatedValue) =>
      Intl.message('Car must be registered!',
          name: 'isRegisteredAssertTrueMessage', args: [validatedValue]);
  @override
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

  @override
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

  String validateManufacturer(Object value) =>
      errorCheck('manufacturer', value);
  String validateDriver(Object value) => errorCheck('driver', value);
  String validateLicensePlate(Object value) =>
      errorCheck('licensePlate', value);
  String validateSeatCount(Object value) => errorCheck('seatCount', value);
  String validateTopSpeed(Object value) => errorCheck('topSpeed', value);
  String validatePrice(Object value) => errorCheck('price', value);
  String validateIsRegistered(Object value) =>
      errorCheck('isRegistered', value);
}

abstract class $_TestDriverValidator implements Validator<Driver> {
  @override
  Map<String, List<ConstraintValidator>> getConstraintValidators() {
    return {
      'name': [NotNullValidator()]
    };
  }

  @override
  Map<String, dynamic> props(Driver instance) {
    return {'name': instance.name};
  }

  String validateName(Object value) => errorCheck('name', value);
}
