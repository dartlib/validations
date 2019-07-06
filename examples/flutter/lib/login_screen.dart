import 'package:flutter/material.dart';
import 'package:validations/validations.dart';

part 'login_screen.gval.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

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
}

@GenValidator()
class LoginFormValidator extends Validator<FormData> with $_LoginFormValidator {
}

// class LoginScreenState extends State<LoginScreen> with ValidationMixin {
class LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  FormData data = FormData();
  LoginFormValidator validator = LoginFormValidator();

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            emailField(),
            passwordField(),
            Container(margin: EdgeInsets.only(top: 25.0)),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
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
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Password',
      ),
      validator: validator.validatePassword,
      onSaved: (String value) {
        data.password = value;
      },
    );
  }

  Widget submitButton() {
    return RaisedButton(
      color: Colors.blue,
      child: Text('Submit'),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
        }
      },
    );
  }
}
