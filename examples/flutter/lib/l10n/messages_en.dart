// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

// ignore: unnecessary_new
final messages = new MessageLookup();

// ignore: unused_element
final _keepAnalysisHappy = Intl.defaultLocale;

// ignore: non_constant_identifier_names
typedef MessageIfAbsent(String message_str, List args);

class MessageLookup extends MessageLookupByLibrary {
  get localeName => 'en';

  static m0(validatedValue) => "Email address is not valid";

  static m1(validatedValue) => "You must fill in an email address";

  static m2(baseField, matchField, validatedValue) => "Password should match password confirmation.";

  static m3(baseField, matchField, validatedValue) => "Password confirmation should match password.";

  static m4(validatedValue) => "Password confirmation cannot be empty";

  static m5(validatedValue) => "Password cannot be blank";

  static m6(min, max, validatedValue) => "Password must be at least be between ${min} and ${max} characters long";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "emailEmailMessage" : m0,
    "emailNotBlankMessage" : m1,
    "formDataFieldMatchBaseFieldMessage" : m2,
    "formDataFieldMatchMatchFieldMessage" : m3,
    "passwordConfirmNotEmptyMessage" : m4,
    "passwordNotBlankMessage" : m5,
    "passwordSizeMessage" : m6
  };
}
