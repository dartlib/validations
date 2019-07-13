/// To use, import `package:validations/annotations/mixed.dart`
library annotations.mixed;

import 'package:meta/meta.dart';

import '../annotation.dart';

part 'mixed/digits.dart';
part 'mixed/size.dart';

const mixedAnnotations = [
  Digits,
  Size,
];
