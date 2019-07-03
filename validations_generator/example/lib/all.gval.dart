// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all.dart';

// **************************************************************************
// ValidatorGenerator
// **************************************************************************

abstract class $_AllValidator implements Validator<All> {
  final Map<String, List<ConstraintValidator>> validators = {
    'manufacturer': [NotNullValidator()],
    'licensePlate': [SizeValidator(min: 2, max: 14), NotNullValidator()],
    'seatCount': [MinValidator(value: 2)],
    'topSpeed': [DecimalMaxValidator(inclusive: true, value: '350')],
    'price': [
      DecimalMaxValidator(inclusive: true, value: '100000')
        ..message = priceDecimalMaxMessage
    ],
    'isRegistered': [
      AssertTrueValidator()..message = isRegisteredAssertTrueMessage
    ]
  };

  static priceDecimalMaxMessage() => r'Price must not be higher than ${value}';
  static isRegisteredAssertTrueMessage() => r'All must be registered!';
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
