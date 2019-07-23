import 'package:flutter/material.dart';
import 'package:validations/validations.dart';

part 'login_screen.g.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

@FieldMatch(
  baseField: 'password',
  matchField: 'passwordConfirm',
  baseFieldMessage: 'Password should match password confirmation.',
  matchFieldMessage: 'Password confirmation should match password.',
)
class FormData {
  @NotBlank(
    message: 'You must fill in an email address',
  )
  @Email()
  String email;

  @NotBlank(
    message: 'Password cannot be blank',
  )
  @Size(
      min: 8,
      max: 12,
      message:
          r'Password must be at least be between $min and $max characters long')
  String password;
  @NotEmpty()
  String passwordConfirm;
}

@GenValidator()
class LoginFormValidator extends Validator<FormData> with _$LoginFormValidator {
}

// class LoginScreenState extends State<LoginScreen> with ValidationMixin {
class LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  FormData data = FormData();
  LoginFormValidator validator = LoginFormValidator();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            emailField(),
            passwordField(),
            passwordConfirmField(),
            Container(margin: const EdgeInsets.only(top: 25.0)),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      autovalidate: true,
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'you@example.com',
      ),
      validator: validator.validateEmail,
      onSaved: (String value) {
        data.email = value;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      autovalidate: true,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Password',
      ),
      onChanged: (value) => data.password = value,
      validator: (value) => validator.validatePassword(value, data),
    );
  }

  Widget passwordConfirmField() {
    return TextFormField(
      obscureText: true,
      autovalidate: true,
      decoration: InputDecoration(
        labelText: 'Confirm Password',
        hintText: 'Re-type password',
      ),
      onChanged: (value) => data.passwordConfirm = value,
      validator: (value) => validator.validatePasswordConfirm(value, data),
    );
  }

  Widget submitButton() {
    return RaisedButton(
      color: Colors.blue,
      child: const Text('Submit'),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
        }
      },
    );
  }
}
