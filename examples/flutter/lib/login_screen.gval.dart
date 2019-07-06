// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_screen.dart';

// **************************************************************************
// ValidatorGenerator
// **************************************************************************

abstract class $_LoginFormValidator implements Validator<FormData> {
  static emailNotBlankMessage(Object validatedValue) =>
      'You must fill in an email address';
  static passwordNotBlankMessage(Object validatedValue) =>
      'Password cannot be blank';
  static passwordSizeMessage(int min, int max, Object validatedValue) =>
      'Password must be at least be between $min and $max characters long';
  Map<String, List<ConstraintValidator>> getConstraintValidators() {
    return {
      'email': [
        NotBlankValidator()..message = emailNotBlankMessage,
        EmailValidator()
      ],
      'password': [
        NotBlankValidator()..message = passwordNotBlankMessage,
        SizeValidator(min: 8, max: 12)..message = passwordSizeMessage
      ]
    };
  }

  Map<String, dynamic> props(FormData instance) {
    return {'email': instance.email, 'password': instance.password};
  }

  String validateEmail(Object value) => errorCheck('email', value);
  String validatePassword(Object value) => errorCheck('password', value);
}
