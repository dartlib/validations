import 'package:validations/annotations/collection.dart';

import '../test_annotation.dart';

void main() {
  testListContainsOnlyAnnotationClassesOrInstances(
    'Collection Annotations List',
    collectionAnnotations,
  );

  testAnnotations('Collection Annotations', collectionAnnotations, {
    #message: 'Test Message',
    #groups: ['test_group'],
  });
}
