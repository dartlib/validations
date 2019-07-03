// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car.dart';

// **************************************************************************
// ValidatorGenerator
// **************************************************************************

class $_CarValidatorMessages {
  static manufacturerNotNull() => 'Should not be null',
  static licensePlateSize(int min, int max) => Intl.message('License plate should be between $min and $max',
     name: 'licensePlateSize', args[min, max];
  );
  static licensePlateSize(int min, int max) => 'License plate should be between $min and $max',

}

// We actually will only pass the message string 'License plate should be between $min and $max'
// Then using Intl is optional, which will then place that message above.
// If no message is given the default message will be used.
// if Intl is not used, the vars are just filled like above.

abstract class $_CarValidator implements Validator<Car> {
  // can make a map of message, but the api will be a bit ugly.

  final Map<String, ConstraintValidator> validators = {
    'manufacturer': [NotNullValidator()..message = $_CarValidatorMessages.manufacturerNotNull],
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
