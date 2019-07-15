import 'package:validations/annotations/file.dart';

import '../test_annotation.dart';

void main() {
  testListContainsOnlyAnnotationClassesOrInstances(
    'File Annotations List',
    fileAnnotations,
  );
}
