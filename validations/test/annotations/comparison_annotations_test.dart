import 'package:validations/annotations/comparison.dart';

import '../test_annotation.dart';

void main() {
  TestAnnotation(DecimalMax, {
    #value: '1.0',
    #inclusive: true,
    #message: 'Test Message',
    #groups: ['text_group'],
  });

  TestAnnotation(DecimalMin, {
    #value: '1.0',
    #inclusive: true,
    #message: 'Test Message',
    #groups: ['text_group'],
  });

  TestAnnotation(DivisibleBy, {
    #value: '2',
    #message: 'Test Message',
    #groups: ['text_group'],
  });

  TestAnnotation(DurationMax, {
    #days: 1,
    #hours: 1,
    #minutes: 1,
    #seconds: 1,
    #milliseconds: 1,
    #microseconds: 1,
    #inclusive: true,
    #message: 'Test Message',
    #groups: ['text_group'],
  });

  TestAnnotation(DurationMin, {
    #days: 1,
    #hours: 1,
    #minutes: 1,
    #seconds: 1,
    #milliseconds: 1,
    #microseconds: 1,
    #inclusive: true,
    #message: 'Test Message',
    #groups: ['text_group'],
  });

  TestAnnotation(EqualTo, {
    #value: '2',
    #message: 'Test Message',
    #groups: ['text_group'],
  });

  TestAnnotation(GreaterThan, {
    #value: 2,
    #message: 'Test Message',
    #groups: ['text_group'],
  });

  TestAnnotation(GreaterThanOrEqual, {
    #value: 2,
    #message: 'Test Message',
    #groups: ['text_group'],
  });

  TestAnnotation(IdenticalTo, {
    #value: 2,
    #message: 'Test Message',
    #groups: ['text_group'],
  });

  TestAnnotation(LessThan, {
    #value: 2,
    #message: 'Test Message',
    #groups: ['text_group'],
  });

  TestAnnotation(LessThanOrEqual, {
    #value: 2,
    #message: 'Test Message',
    #groups: ['text_group'],
  });

  TestAnnotation(Max, {
    #value: 2,
    #message: 'Test Message',
    #groups: ['text_group'],
  });

  TestAnnotation(Min, {
    #value: 2,
    #message: 'Test Message',
    #groups: ['text_group'],
  });

  TestAnnotation(NotEqualTo, {
    #value: '2',
    #message: 'Test Message',
    #groups: ['text_group'],
  });

  TestAnnotation(NotIdenticalTo, {
    #value: 2,
    #message: 'Test Message',
    #groups: ['text_group'],
  });

  TestAnnotation(Range, {
    #min: 2,
    #max: 4,
    #message: 'Test Message',
    #groups: ['text_group'],
  });
}
