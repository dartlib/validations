// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car.dart';

// **************************************************************************
// ValidatorGenerator
// **************************************************************************

abstract class _$TestCarValidator implements Validator<Car> {
  static String carFieldMatchMessage(
          String baseField, String matchField, Object validatedValue) =>
      Intl.message('Left and Right front wheel covers should match!',
          name: 'carFieldMatchMessage',
          args: [baseField, matchField, validatedValue]);
  static String carFieldMatchMessage2(
          String baseField, String matchField, Object validatedValue) =>
      Intl.message('Left and Right rear wheel covers should match!',
          name: 'carFieldMatchMessage2',
          args: [baseField, matchField, validatedValue]);
  @override
  ClassValidator getClassValidator() {
    return ClassValidator<Car>(validators: [
      FieldMatchValidator(
          baseField: 'frontWheelCoverLeft', matchField: 'frontWheelCoverRight')
        ..message = carFieldMatchMessage,
      FieldMatchValidator(
          baseField: 'rearWheelCoverLeft', matchField: 'rearWheelCoverRight')
        ..message = carFieldMatchMessage2
    ]);
  }

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
      Intl.message('Price must not be higher than $value',
          name: 'priceDecimalMaxMessage',
          args: [value, inclusive, validatedValue]);
  static String priceDecimalMinMessage2(
          String value, bool inclusive, Object validatedValue) =>
      Intl.message('Price must not be lower than $value',
          name: 'priceDecimalMinMessage2',
          args: [value, inclusive, validatedValue]);
  static String isRegisteredIsTrueMessage(Object validatedValue) =>
      Intl.message('Car must be registered!',
          name: 'isRegisteredIsTrueMessage', args: [validatedValue]);
  @override
  List<FieldValidator> getFieldValidators() {
    return [
      FieldValidator<String>(
          name: 'manufacturer', validators: [NotNullValidator()]),
      FieldValidator<Driver>(name: 'driver', validators: [
        ValidValidator(
          TestDriverValidator()..validationContext = validationContext,
        )..message = driverValidMessage
      ]),
      FieldValidator<String>(name: 'licensePlate', validators: [
        SizeValidator(min: 2, max: 14)..message = licensePlateSizeMessage,
        NotNullValidator()
      ]),
      FieldValidator<int>(name: 'seatCount', validators: [
        MinValidator(value: 1)..message = seatCountMinMessage,
        MaxValidator(value: 2)..message = seatCountMaxMessage
      ]),
      FieldValidator<int>(
          name: 'topSpeed',
          validators: [MaxValidator(value: 350)..message = topSpeedMaxMessage]),
      FieldValidator<String>(
          name: 'frontWheelCoverLeft', validators: [NotEmptyValidator()]),
      FieldValidator<String>(
          name: 'frontWheelCoverRight', validators: [NotEmptyValidator()]),
      FieldValidator<String>(
          name: 'rearWheelCoverLeft', validators: [NotEmptyValidator()]),
      FieldValidator<String>(
          name: 'rearWheelCoverRight', validators: [NotEmptyValidator()]),
      FieldValidator<Decimal>(name: 'price', validators: [
        DecimalMaxValidator(value: '100.00', inclusive: true)
          ..message = priceDecimalMaxMessage,
        DecimalMinValidator(value: '49.99', inclusive: true)
          ..message = priceDecimalMinMessage2
      ]),
      FieldValidator<bool>(
          name: 'isRegistered',
          validators: [IsTrueValidator()..message = isRegisteredIsTrueMessage])
    ];
  }

  String validateManufacturer(Object value) =>
      errorCheck('manufacturer', value);
  String validateDriver(Object value) => errorCheck('driver', value);
  String validateLicensePlate(Object value) =>
      errorCheck('licensePlate', value);
  String validateSeatCount(Object value) => errorCheck('seatCount', value);
  String validateTopSpeed(Object value) => errorCheck('topSpeed', value);
  String validateFrontWheelCoverLeft(Object value) =>
      errorCheck('frontWheelCoverLeft', value);
  String validateFrontWheelCoverRight(Object value) =>
      errorCheck('frontWheelCoverRight', value);
  String validateRearWheelCoverLeft(Object value) =>
      errorCheck('rearWheelCoverLeft', value);
  String validateRearWheelCoverRight(Object value) =>
      errorCheck('rearWheelCoverRight', value);
  String validatePrice(Object value) => errorCheck('price', value);
  String validateIsRegistered(Object value) =>
      errorCheck('isRegistered', value);
  String validateCar(Object value) => errorCheck('Car', value);
  @override
  Map<String, dynamic> props(Car instance) {
    return {
      'manufacturer': instance.manufacturer,
      'driver': instance.driver,
      'licensePlate': instance.licensePlate,
      'seatCount': instance.seatCount,
      'topSpeed': instance.topSpeed,
      'frontWheelCoverLeft': instance.frontWheelCoverLeft,
      'frontWheelCoverRight': instance.frontWheelCoverRight,
      'rearWheelCoverLeft': instance.rearWheelCoverLeft,
      'rearWheelCoverRight': instance.rearWheelCoverRight,
      'price': instance.price,
      'isRegistered': instance.isRegistered
    };
  }
}

abstract class _$TestDriverValidator implements Validator<Driver> {
  @override
  List<FieldValidator> getFieldValidators() {
    return [
      FieldValidator<String>(name: 'name', validators: [NotNullValidator()])
    ];
  }

  String validateName(Object value) => errorCheck('name', value);
  String validateDriver(Object value) => errorCheck('Driver', value);
  @override
  Map<String, dynamic> props(Driver instance) {
    return {'name': instance.name};
  }
}
