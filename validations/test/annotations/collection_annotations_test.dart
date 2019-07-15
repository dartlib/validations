import 'package:validations/annotations/collection.dart';

import '../test_annotation.dart';

void main() {
  TestAnnotations('Collection Annotations', collectionAnnotations, {
    #message: 'Test Message',
    #groups: ['test_group'],
  });
}
