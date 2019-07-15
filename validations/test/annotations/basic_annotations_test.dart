import 'package:validations/annotations/basic.dart';

import '../test_annotation.dart';

void main() {
  testListContainsOnlyAnnotationClassesOrInstances(
    'Basic Annotations List',
    basicAnnotations,
  );

  testAnnotations('Basic Annotations', basicAnnotations, {
    #message: 'Test Message',
    #groups: ['test_group'],
  });
}
