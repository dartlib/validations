// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_screen.dart';

// **************************************************************************
// ValidatorGenerator
// **************************************************************************

abstract class _$LoginFormValidator implements Validator<FormData> {
  static String emailNotBlankMessage(Object validatedValue) =>
      Intl.message('You must fill in an email address',
          name: 'emailNotBlankMessage', args: [validatedValue]);
  static String emailEmailMessage(Object validatedValue) =>
      Intl.message('Email address is not valid',
          name: 'emailEmailMessage', args: [validatedValue]);
  static String passwordNotBlankMessage(Object validatedValue) =>
      Intl.message('Password cannot be blank',
          name: 'passwordNotBlankMessage', args: [validatedValue]);
  static String passwordSizeMessage(int min, int max, Object validatedValue) =>
      Intl.message(
          'Password must be at least be between $min and $max characters long',
          name: 'passwordSizeMessage',
          args: [min, max, validatedValue]);
  static String passwordConfirmNotEmptyMessage(Object validatedValue) =>
      Intl.message('Password confirmation cannot be empty',
          name: 'passwordConfirmNotEmptyMessage', args: [validatedValue]);
  static String formDataFieldMatchBaseFieldMessage(
          String baseField, String matchField, Object validatedValue) =>
      Intl.message('Password should match password confirmation.',
          name: 'formDataFieldMatchBaseFieldMessage',
          args: [baseField, matchField, validatedValue]);
  static String formDataFieldMatchMatchFieldMessage(
          String baseField, String matchField, Object validatedValue) =>
      Intl.message('Password confirmation should match password.',
          name: 'formDataFieldMatchMatchFieldMessage',
          args: [baseField, matchField, validatedValue]);
  @override
  List<FieldValidator> getFieldValidators() {
    return [
      FieldValidator<String>(name: 'email', validators: [
        NotBlankValidator()..message = emailNotBlankMessage,
        EmailValidator()..message = emailEmailMessage
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
          validators: [
            NotEmptyValidator()..message = passwordConfirmNotEmptyMessage
          ],
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
