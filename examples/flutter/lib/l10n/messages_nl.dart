// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a nl locale. All the
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
  get localeName => 'nl';

  static m1(validatedValue) => "Je moet een email address invullen";

  static m2(baseField, matchField, validatedValue) => "Wachtwoorden moeten overeenkomen.";

  static m3(baseField, matchField, validatedValue) => "Wachtwoorden moeten overeenkomen.";

  static m5(validatedValue) => "Wachtwoord moet ingevuld worden";

  static m6(min, max, validatedValue) => "Watchwoord moet tussen ${min} en ${max} tekens lang zijn";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "emailNotBlankMessage" : m1,
    "formDataFieldMatchBaseFieldMessage" : m2,
    "formDataFieldMatchMatchFieldMessage" : m3,
    "passwordNotBlankMessage" : m5,
    "passwordSizeMessage" : m6
  };
}
