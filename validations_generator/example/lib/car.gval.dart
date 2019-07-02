// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car.dart';

// **************************************************************************
// ValidatorGenerator
// **************************************************************************

abstract class $_CarValidator implements Validator<Car> {
  final Map<String, ConstraintValidator> validators = {
    'manufacturer': [NotNullValidator()],
    'licensePlate': [SizeValidator(min: 2, max: 14), NotNullValidator()],
    'seatCount': [
      MinValidator(value: 2, message: r'There must be at least {value} seat(s)')
    ],
    'topSpeed': [DecimalMaxValidator(inclusive: true, value: '350')],
    'price': [
      DecimalMaxValidator(
          inclusive: true,
          value: '100000',
          message: r'Price must not be higher than ${value}')
    ],
    'really': [AssertFalseValidator(message: r'You are kidding me!')]
  };

  Map<String, dynamic> props(Car instance) {
    return {
      'manufacturer': instance.manufacturer,
      'licensePlate': instance.licensePlate,
      'seatCount': instance.seatCount,
      'topSpeed': instance.topSpeed,
      'price': instance.price,
      'really': instance.really
    };
  }
}
