import 'package:meta/meta.dart';

/// The annotated element must be [false] or [null]
@immutable
class AssertFalse {
  final String message;
  const AssertFalse({
    this.message,
  });
}

/// The annotated element must be [true]
@immutable
class AssertTrue {
  final String message;
  const AssertTrue({
    this.message,
  });
}

@immutable
class CreditCardNumber {
  final String message;
  const CreditCardNumber({
    this.message,
  });
}

@immutable
class Currency {
  final String message;
  const Currency({
    this.message,
  });
}

@immutable
class DecimalMax {
  final String value;
  final String message;
  final bool inclusive;
  const DecimalMax({
    this.value,
    this.message,
    this.inclusive = true,
  });
}

@immutable
class DecimalMin {
  final String value;
  final String message;
  final bool inclusive;
  const DecimalMin({
    this.value,
    this.message,
    this.inclusive = true,
  });
}

@immutable
class Digits {
  // maximum number of integral digits accepted for this number
  final int integer;
  // maximum number of fractional digits accepted for this number
  final int fraction;
  final String message;
  const Digits({
    this.integer,
    this.fraction,
    this.message,
  });
}

@immutable
class DurationMax {
  final String message;
  const DurationMax({
    this.message,
  });
}

@immutable
class DurationMin {
  final String message;
  const DurationMin({
    this.message,
  });
}

@immutable
class EAN {
  final String message;
  const EAN({
    this.message,
  });
}

@immutable
class Email {
  final String message;
  const Email({
    this.message,
  });
}

@immutable
class Future {
  final String message;
  const Future({
    this.message,
  });
}

@immutable
class FutureOrPresent {
  final String message;
  const FutureOrPresent({
    this.message,
  });
}

@immutable
class ISBN {
  final String message;
  const ISBN({
    this.message,
  });
}

@immutable
class Length {
  final String message;
  const Length({
    this.message,
  });
}

@immutable
class Min {
  final int value;
  final String message;
  const Min({
    this.value,
    this.message,
  });
}

@immutable
class Max {
  final int value;
  final String message;
  const Max({
    this.value,
    this.message,
  });
}

@immutable
class Negative {
  final String message;
  const Negative({
    this.message,
  });
}

@immutable
class NegativeOrZero {
  final String message;
  const NegativeOrZero({
    this.message,
  });
}

@immutable
class NotBlank {
  final String message;
  const NotBlank({
    this.message,
  });
}

@immutable
class NotEmpty {
  final String message;
  const NotEmpty({
    this.message,
  });
}

@immutable
class NotNull {
  final String message;
  const NotNull({
    this.message,
  });
}

@immutable
class Null {
  final String message;
  const Null({
    this.message,
  });
}

@immutable
class Past {
  final String message;
  const Past({
    this.message,
  });
}

@immutable
class PastOrPresent {
  final String message;
  const PastOrPresent({
    this.message,
  });
}

@immutable
class Pattern {
  final String message;
  final RegExp regexp;
  const Pattern({
    this.regexp,
    this.message,
  });
}

@immutable
class Positive {
  final String message;
  const Positive({
    this.message,
  });
}

@immutable
class PositiveOrZero {
  final String message;
  const PositiveOrZero({
    this.message,
  });
}

@immutable
class Range {
  final String message;
  const Range({
    this.message,
  });
}

@immutable
class SafeHtml {
  final String message;
  const SafeHtml({
    this.message,
  });
}

@immutable
class Size {
  final double min;
  final double max;
  final String message;
  const Size({
    this.min = 0,
    this.max = double.maxFinite,
    this.message,
  });
}

@immutable
class UniqueElement {
  final String message;
  const UniqueElement({
    this.message,
  });
}

@immutable
class URL {
  final String message;
  const URL({
    this.message,
  });
}

final fieldAnnotations = [
  AssertFalse,
  AssertTrue,
  CreditCardNumber,
  Currency,
  DecimalMax,
  DurationMax,
  DurationMin,
  EAN,
  Email,
  Future,
  FutureOrPresent,
  ISBN,
  Length,
  Min,
  Max,
  Negative,
  NegativeOrZero,
  NotBlank,
  NotEmpty,
  NotNull,
  Past,
  PastOrPresent,
  Pattern,
  Positive,
  PositiveOrZero,
  Range,
  SafeHtml,
  Size,
  UniqueElement,
  URL,
];
