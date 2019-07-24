/// To use, import `package:validations/annotations/class_level.dart`
library annotations.class_level;

import 'package:meta/meta.dart';

import '../annotation.dart';
import '../validators.dart';

part 'class_level/field_match.dart';

final classLevelAnnotations = [
  FieldMatch,
];
