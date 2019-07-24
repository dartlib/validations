/// To use, import `package:validations/annotations/comparison.dart`
library annotations.comparison;

import 'package:meta/meta.dart';

import '../annotation.dart';
import '../validators.dart';

part 'comparison/decimal_max.dart';
part 'comparison/decimal_min.dart';
part 'comparison/divisible_by.dart';
part 'comparison/duration_max.dart';
part 'comparison/duration_min.dart';
part 'comparison/equal_to.dart';
part 'comparison/greater_than.dart';
part 'comparison/greater_than_or_equal.dart';
part 'comparison/identical_to.dart';
part 'comparison/less_than.dart';
part 'comparison/less_than_or_equal.dart';
part 'comparison/max.dart';
part 'comparison/min.dart';
part 'comparison/not_equal_to.dart';
part 'comparison/not_identical_to.dart';
part 'comparison/range.dart';

final comparisonAnnotations = [
  DecimalMax,
  DecimalMin,
  DivisibleBy,
  DurationMax,
  DurationMin,
  EqualTo,
  GreaterThan,
  GreaterThanOrEqual,
  IdenticalTo,
  LessThan,
  LessThanOrEqual,
  Max,
  Min,
  NotEqualTo,
  NotIdenticalTo,
  Range,
];
