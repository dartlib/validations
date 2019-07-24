import 'package:validations/annotations/string.dart';

import '../test_annotation.dart';

final commonAnnotations = [
  Alpha,
  CreditCardNumber,
  Email,
  HexColor,
  Hexadecimal,
  Json,
  Lowercase,
  MongoId,
  Numeric,
  Uppercase,
];

void main() {
  testListContainsOnlyAnnotationClassesOrInstances(
    'String Annotations List',
    stringAnnotations,
  );

  testAnnotations('String Annotations', commonAnnotations, {
    #message: 'Test Message',
    #groups: ['test_group'],
  });

  TestAnnotation(ISBN, {
    #type: 'ISBN-13',
    #message: 'Test Message',
    #groups: ['text_group'],
  });

  TestAnnotation(Pattern, {
    #regexp: r'^-?[0-9]+$',
    #message: 'Test Message',
    #groups: ['text_group'],
  });

  TestAnnotation(URL, {
    #protocol: 'http',
    #host: '127.0.0.1',
    #port: 8080,
    #regexp: r'^-?[0-9]+$',
    #message: 'Test Message',
    #groups: ['text_group'],
  });

  TestAnnotation(Uuid, {
    #version: 4,
    #message: 'Test Message',
    #groups: ['text_group'],
  });
}
