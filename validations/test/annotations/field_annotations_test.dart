import 'package:validations/annotations.dart';

import '../test_annotation.dart';

void main() {
  testListContainsOnlyAnnotationClassesOrInstances(
    'Field Annotations List',
    fieldAnnotations,
  );
}
