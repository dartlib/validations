library annotations.number;

import 'package:meta/meta.dart';

import '../annotation.dart';

part 'number/digits.dart';
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
  Digits,
  Negative,
  NegativeOrZero,
  Positive,
  PositiveOrZero,
];
