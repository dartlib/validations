// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all.dart';

// **************************************************************************
// ValidatorGenerator
// **************************************************************************

abstract class $_TestValidator implements Validator<All> {
  final Map<String, List<ConstraintValidator>> validators = {
    'manufacturer': [NotNullValidator()],
    'licensePlate': [
      SizeValidator(min: 2, max: 14)..message = licensePlateSizeMessage,
      NotNullValidator()
    ],
    'seatCount': [MinValidator(value: 2)],
    'topSpeed': [
      DecimalMaxValidator(inclusive: true, value: '350')
        ..message = topSpeedDecimalMaxMessage
    ],
    'price': [
      DecimalMaxValidator(inclusive: true, value: '100000')
        ..message = priceDecimalMaxMessage
    ],
    'isRegistered': [
      AssertTrueValidator()..message = isRegisteredAssertTrueMessage
    ]
  };

  static licensePlateSizeMessage(int max, int min, Object validatedValue) =>
      'The license plate ${validatedValue} must be between ${min} and ${max} characters long';
  static topSpeedDecimalMaxMessage(
          String value, bool inclusive, Object validatedValue) =>
      'The top speed ${validatedValue} is higher than ${value}';
  static priceDecimalMaxMessage(
          String value, bool inclusive, Object validatedValue) =>
      'Price must not be higher than ${value}';
  static isRegisteredAssertTrueMessage(Object validatedValue) =>
      'All must be registered!';
  Map<String, dynamic> props(All instance) {
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
