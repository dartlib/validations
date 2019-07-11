// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_screen.dart';

// **************************************************************************
// ValidatorGenerator
// **************************************************************************

abstract class $_LoginFormValidator implements Validator<FormData> {
  static String passwordSizeMessage(int min, int max, Object validatedValue) =>
      Intl.message(
          'Password must be at least be between $min and $max characters long',
          name: 'passwordSizeMessage',
          args: [min, max, validatedValue]);
  @override
  Map<String, List<ConstraintValidator>> getConstraintValidators() {
    return {
      'email': [NotBlankValidator(), EmailValidator()],
      'password': [
        NotBlankValidator(),
        SizeValidator(min: 8, max: 12)..message = passwordSizeMessage
      ]
    };
  }

  @override
  Map<String, dynamic> props(FormData instance) {
    return {'email': instance.email, 'password': instance.password};
  }

  String validateEmail(Object value) => errorCheck('email', value);
  String validatePassword(Object value) => errorCheck('password', value);
}
