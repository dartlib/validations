// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car.dart';

// **************************************************************************
// ValidatorGenerator
// **************************************************************************

abstract class $_CarValidator implements Validator<Car> {
  final Map<String, List<ConstraintValidator>> validators = {
    'manufacturer': [NotNullValidator()],
    'licensePlate': [SizeValidator(min: 2, max: 14), NotNullValidator()],
    'seatCount': [MinValidator(value: 2)..message = seatCountMinMessage],
    'topSpeed': [DecimalMaxValidator(inclusive: true, value: '350')],
    'price': [
      DecimalMaxValidator(inclusive: true, value: '100000')
        ..message = priceDecimalMaxMessage
    ],
    'isRegistered': [
      AssertTrueValidator()..message = isRegisteredAssertTrueMessage
    ]
  };

  static seatCountMinMessage(num value, Object validatedValue) =>
      'WORKS!!! There must be at least {value} seat(s)';
  static priceDecimalMaxMessage(
          String value, bool inclusive, Object validatedValue) =>
      'Price must not be higher than ${value}';
  static isRegisteredAssertTrueMessage(Object validatedValue) =>
      'Car must be registered!';
  Map<String, dynamic> props(Car instance) {
    return {
      'manufacturer': instance.manufacturer,
      'licensePlate': instance.licensePlate,
      'seatCount': instance.seatCount,
      'topSpeed': instance.topSpeed,
      'price': instance.price,
      'isRegistered': instance.isRegistered
    };
  }
}
