library annotations.number;

import 'package:meta/meta.dart';
import 'package:validations/validator_annotation.dart';

part 'number/digits.dart';
part 'number/negative.dart';
part 'number/negative_or_zero.dart';
part 'number/positive.dart';
part 'number/positive_or_zero.dart';

final numberAnnotations = [
  Digits,
  Negative,
  NegativeOrZero,
  Positive,
  PositiveOrZero,
];
