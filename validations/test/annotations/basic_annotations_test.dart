import 'package:validations/annotations/basic.dart';

import '../test_annotation.dart';

void main() {
  testAnnotations('Basic Annotations', basicAnnotations, {
    #message: 'Test Message',
    #groups: ['test_group'],
  });
}
