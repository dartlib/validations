import 'package:validations/annotations/string.dart';

import '../test_annotation.dart';

void main() {
  testAnnotations('String Annotations', [
    Alpha,
    CreditCardNumber,
    EAN,
    Email,
    HexColor,
    Hexadecimal,
    Json,
    Length,
    Lowercase,
    MongoId,
    Numeric,
    SafeHtml,
    Uppercase,
  ], {
    #message: 'Test Message',
    #groups: ['test_group'],
  });

  testAnnotation(ISBN, {
    #type: 'ISBN-13',
    #message: 'Test Message',
    #groups: ['text_group'],
  });

  testAnnotation(Pattern, {
    #regexp: r'^-?[0-9]+$',
    #message: 'Test Message',
    #groups: ['text_group'],
  });

  testAnnotation(URL, {
    #protocol: 'http',
    #host: '127.0.0.1',
    #port: 8080,
    #regexp: r'^-?[0-9]+$',
    #message: 'Test Message',
    #groups: ['text_group'],
  });

  testAnnotation(Uuid, {
    #version: 4,
    #message: 'Test Message',
    #groups: ['text_group'],
  });
}
