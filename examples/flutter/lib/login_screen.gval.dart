// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_screen.dart';

// **************************************************************************
// ValidatorGenerator
// **************************************************************************

abstract class $_LoginFormValidator implements Validator<FormData> {
  static String emailNotBlankMessage(Object validatedValue) =>
      Intl.message('You must fill in an email address',
          name: 'emailNotBlankMessage', args: [validatedValue]);
  static String passwordNotBlankMessage(Object validatedValue) =>
      Intl.message('Password cannot be blank',
          name: 'passwordNotBlankMessage', args: [validatedValue]);
  static String passwordSizeMessage(int min, int max, Object validatedValue) =>
      Intl.message(
          'Password must be at least be between $min and $max characters long',
          name: 'passwordSizeMessage',
          args: [min, max, validatedValue]);
  @override
  List<FieldValidator> getFieldValidators() {
    return [
      FieldValidator<String>(name: 'email', validators: [
        NotBlankValidator()..message = emailNotBlankMessage,
        EmailValidator()
      ]),
      FieldValidator<String>(name: 'password', validators: [
        NotBlankValidator()..message = passwordNotBlankMessage,
        SizeValidator(min: 8, max: 12)..message = passwordSizeMessage
      ])
    ];
  }

  @override
  Map<String, dynamic> props(FormData instance) {
    return {'email': instance.email, 'password': instance.password};
  }

  String validateEmail(Object value) => errorCheck('email', value);
  String validatePassword(Object value) => errorCheck('password', value);
}
