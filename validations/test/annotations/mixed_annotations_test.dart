import 'package:validations/annotations/mixed.dart';

import '../test_annotation.dart';

void main() {
  testListContainsOnlyAnnotationClassesOrInstances(
    'Mixed Annotations List',
    mixedAnnotations,
  );

  TestAnnotation(Digits, {
    #integer: 3,
    #fraction: 2,
    #message: 'Test Message',
    #groups: ['text_group'],
  });

  TestAnnotation(Size, {
    #min: 2,
    #max: 4,
    #message: 'Test Message',
    #groups: ['text_group'],
  });
}
