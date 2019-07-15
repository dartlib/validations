import 'package:validations/annotations/date.dart';
import 'package:validations/validators/date.dart';

import '../test_annotation.dart';

void main() {
  TestAnnotation(After, {
    #year: 2019,
    #month: 7,
    #day: 15,
    #hour: 19,
    #minute: 5,
    #second: 35,
    #millisecond: 0,
    #microsecond: 0,
    #message: 'Test Message',
    #groups: ['text_group'],
  });

  TestAnnotation(Before, {
    #year: 2019,
    #month: 7,
    #day: 15,
    #hour: 19,
    #minute: 5,
    #second: 35,
    #millisecond: 0,
    #microsecond: 0,
    #message: 'Test Message',
    #groups: ['text_group'],
  });

  TestAnnotation(FutureOrPresent, {
    #timeUnit: TimeUnit.month,
    #message: 'Test Message',
    #groups: ['text_group'],
  });

  TestAnnotation(InFuture, {
    #timeUnit: TimeUnit.month,
    #message: 'Test Message',
    #groups: ['text_group'],
  });

  TestAnnotation(Past, {
    #timeUnit: TimeUnit.month,
    #message: 'Test Message',
    #groups: ['text_group'],
  });

  TestAnnotation(PastOrPresent, {
    #timeUnit: TimeUnit.month,
    #message: 'Test Message',
    #groups: ['text_group'],
  });
}
