// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_screen.dart';

// **************************************************************************
// ValidatorGenerator
// **************************************************************************

abstract class _$LoginFormValidator implements Validator<FormData> {
  static String emailNotBlankMessage(Object validatedValue) {
    return 'You must fill in an email address';
  }

  static String passwordNotBlankMessage(Object validatedValue) {
    return 'Password cannot be blank';
  }

  static String passwordSizeMessage(int min, int max, Object validatedValue) {
    return 'Password must be at least be between $min and $max characters long';
  }

  static String formDataFieldMatchBaseFieldMessage(
      String baseField, String matchField, Object validatedValue) {
    return 'Password should match password confirmation.';
  }

  static String formDataFieldMatchMatchFieldMessage(
      String baseField, String matchField, Object validatedValue) {
    return 'Password confirmation should match password.';
  }

  @override
  List<FieldValidator> getFieldValidators() {
    return [
      FieldValidator<String>(name: 'email', validators: [
        NotBlankValidator()..message = emailNotBlankMessage,
        EmailValidator()
      ]),
      FieldValidator<String>(
          name: 'password',
          validators: [
            NotBlankValidator()..message = passwordNotBlankMessage,
            SizeValidator(min: 8, max: 12)..message = passwordSizeMessage
          ],
          validateClass: true),
      FieldValidator<String>(
          name: 'passwordConfirm',
          validators: [NotEmptyValidator()],
          validateClass: true)
    ];
  }

  String validateEmail(Object value) => errorCheck('email', value);
  String validatePassword(Object value, FormData object) =>
      crossErrorCheck(object, 'password', value);
  String validatePasswordConfirm(Object value, FormData object) =>
      crossErrorCheck(object, 'passwordConfirm', value);
  @override
  PropertyMap<FormData> props(FormData instance) {
    return PropertyMap<FormData>({
      'email': instance.email,
      'password': instance.password,
      'passwordConfirm': instance.passwordConfirm
    });
  }

  @override
  ClassValidator getClassValidator() {
    return ClassValidator<FormData>(validators: [
      FieldMatchValidator(baseField: 'password', matchField: 'passwordConfirm')
        ..affectedFields = ['password', 'passwordConfirm']
        ..baseFieldMessage = formDataFieldMatchBaseFieldMessage
        ..matchFieldMessage = formDataFieldMatchMatchFieldMessage
    ]);
  }
}
