import 'package:validations/annotations/number.dart';

import '../test_annotation.dart';

void main() {
  TestAnnotations('Number Annotations', numberAnnotations, {
    #message: 'Test Message',
    #groups: ['test_group'],
  });
}
