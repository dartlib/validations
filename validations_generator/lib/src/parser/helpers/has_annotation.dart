import 'package:analyzer/dart/element/element.dart';

import 'get_annotation.dart';

bool hasAnnotation(Element field, String name) {
  return getAnnotation(field, name) != null;
}
