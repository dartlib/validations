// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car.dart';

// **************************************************************************
// ValidatorGenerator
// **************************************************************************

abstract class $_TestCarValidator implements Validator<Car> {
  static String licensePlateSizeMessage(
          int min, int max, Object validatedValue) =>
      Intl.message(
          'The license plate $validatedValue must be between $min and $max characters long',
          name: 'licensePlateSizeMessage',
          args: [min, max, validatedValue]);
  @override
  Map<String, List<ConstraintValidator>> getConstraintValidators() {
    return {
      'manufacturer': [NotNullValidator()],
      'driver': [ValidValidator()],
      'licensePlate': [
        SizeValidator(min: 2, max: 14)..message = licensePlateSizeMessage,
        NotNullValidator()
      ],
      'seatCount': [MinValidator(), MaxValidator()],
      'topSpeed': [MaxValidator()],
      'price': [
        DecimalMaxValidator(inclusive: true, value: '100.00'),
        DecimalMinValidator(inclusive: true, value: '49.99')
      ],
      'isRegistered': [IsTrueValidator()]
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
