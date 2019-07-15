import 'package:validations/annotations/money.dart';

import '../test_annotation.dart';

void main() {
  testListContainsOnlyAnnotationClassesOrInstances(
    'Money Annotations List',
    moneyAnnotations,
  );
}
