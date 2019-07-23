/// To use, import `package:validations/annotations/number.dart`
library annotations.number;

import 'package:meta/meta.dart';

import '../annotation.dart';
import '../validators.dart';

part 'number/negative.dart';
part 'number/negative_or_zero.dart';
part 'number/positive.dart';
part 'number/positive_or_zero.dart';

/// [Negative] annotation using default values
const negative = Negative();

/// [NegativeOrZero] annotation using default values
const negativeOrZero = NegativeOrZero();

/// [Positive] annotation using default values
const positive = Positive();

/// [PositiveOrZero] annotation using default values
const positiveOrZero = PositiveOrZero();

final numberAnnotations = [
  negative,
  negativeOrZero,
  positive,
  positiveOrZero,
  Negative,
  NegativeOrZero,
  Positive,
  PositiveOrZero,
];
