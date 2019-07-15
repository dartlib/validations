import 'package:validations/annotations/choice.dart';

import '../test_annotation.dart';

void main() {
  testListContainsOnlyAnnotationClassesOrInstances(
    'Choice Annotations List',
    choiceAnnotations,
  );
}
