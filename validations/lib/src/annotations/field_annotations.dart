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

/// Checks that the annotated character sequence passes the Luhn checksum test.
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

/// Checks whether the annotated value is less than the specified maximum,
/// when inclusive=false. Otherwise whether the value is less than or equal to
/// the specified maximum. The parameter value is the string representation of
/// the max value.
@immutable
class DecimalMax {
  final String value;
  final String message;
  final bool inclusive;
  const DecimalMax({
    @required this.value,
    this.inclusive = true,
    this.message,
  }) : assert(value != null);
}

/// Checks whether the annotated value is larger than the specified minimum,
/// when inclusive=false. Otherwise whether the value is larger than or equal to
/// the specified minimum. The parameter value is the string representation of
/// the min value.
@immutable
class DecimalMin {
  final String value;
  final String message;
  final bool inclusive;
  const DecimalMin({
    @required this.value,
    this.message,
    this.inclusive = true,
  }) : assert(value != null);
}

/// Checks whether the annotated value is a number having up to [integer] digits
/// and [fraction] fractional digits.
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

/// Checks that annotated java.time.Duration element is not greater than the one
/// constructed from annotation parameters. Equality is allowed if inclusive
/// flag is set to true.
@immutable
class DurationMax {
  final String message;
  final int days;
  final int hours;
  final int minutes;
  final int seconds;
  final int millis;
  final int nanos;
  final bool inclusive;
  const DurationMax({
    this.days,
    this.hours,
    this.minutes,
    this.seconds,
    this.millis,
    this.nanos,
    this.inclusive,
    this.message,
  });
}

/// Checks that annotated java.time.Duration element is not less than the one
/// constructed from annotation parameters. Equality is allowed if inclusive
/// flag is set to true.
@immutable
class DurationMin {
  final String message;
  final int days;
  final int hours;
  final int minutes;
  final int seconds;
  final int millis;
  final int nanos;
  final bool inclusive;
  const DurationMin({
    this.days,
    this.hours,
    this.minutes,
    this.seconds,
    this.millis,
    this.nanos,
    this.inclusive,
    this.message,
  });
}

/// Checks that the annotated character sequence is a valid EAN barcode.
/// [type] determines the type of barcode. The default is EAN-13.
@immutable
class EAN {
  final String message;
  final String type;
  const EAN({
    this.message,
    this.type = 'EAN-13',
  });
}

/// Checks whether the specified character sequence is a valid email address.
@immutable
class Email {
  final String message;
  const Email({
    this.message,
  });
}

/// Checks whether the annotated date is in the future
@immutable
class Future {
  final String message;
  const Future({
    this.message,
  });
}

/// Checks whether the annotated date is in the present or in the future
@immutable
class FutureOrPresent {
  final String message;
  const FutureOrPresent({
    this.message,
  });
}

/// Checks that the annotated character sequence is a valid ISBN.
/// type determines the type of ISBN. The default is ISBN-13.
@immutable
class ISBN {
  final String message;
  final String type;
  const ISBN({
    this.message,
    this.type = 'ISBN-13',
  });
}

/// Validates that the annotated character sequence is between
/// min and max included.
@immutable
class Length {
  final String message;
  final double min;
  final double max;
  const Length({
    this.min,
    this.max,
    this.message,
  });
}

// Checks whether the annotated value is higher than or equal to the specified
// minimum.
@immutable
class Min {
  final num value;
  final String message;
  const Min({
    @required this.value,
    this.message,
  });
}

// Checks whether the annotated value is less than or equal to the specified
// maximum.
@immutable
class Max {
  final num value;
  final String message;
  const Max({
    @required this.value,
    this.message,
  });
}

/// Checks if the element is strictly negative. Zero values are considered
/// invalid.
@immutable
class Negative {
  final String message;
  const Negative({
    this.message,
  });
}

/// Checks if the element is negative or zero.
@immutable
class NegativeOrZero {
  final String message;
  const NegativeOrZero({
    this.message,
  });
}

/// Checks that the annotated character sequence is not null and the trimmed
/// length is greater than 0.
@immutable
class NotBlank {
  final String message;
  const NotBlank({
    this.message,
  });
}

/// Checks whether the annotated element is not null nor empty
@immutable
class NotEmpty {
  final String message;
  const NotEmpty({
    this.message,
  });
}

/// Checks whether the annotated element is not null
@immutable
class NotNull {
  final String message;
  const NotNull({
    this.message,
  });
}

/// Checks whether the annotated element is null
@immutable
class Null {
  final String message;
  const Null({
    this.message,
  });
}

/// Checks whether the annotated date is in the past
@immutable
class Past {
  final String message;
  const Past({
    this.message,
  });
}

/// Checks whether the annotated date is in the past or in the present
@immutable
class PastOrPresent {
  final String message;
  const PastOrPresent({
    this.message,
  });
}

/// Checks if the annotated string matches the regular expression [regexp]
@immutable
class Pattern {
  final String message;
  final RegExp regexp;
  const Pattern({
    @required this.regexp,
    this.message,
  });
}

/// Checks if the element is strictly positive. Zero values are considered
/// invalid.
@immutable
class Positive {
  final String message;
  const Positive({
    this.message,
  });
}

/// Checks if the element is positive or zero.
@immutable
class PositiveOrZero {
  final String message;
  const PositiveOrZero({
    this.message,
  });
}

/// Checks whether the annotated value lies between (inclusive) the specified
/// minimum and maximum
@immutable
class Range {
  final String message;
  final double min;
  final double max;
  const Range({
    this.min,
    this.max,
    this.message,
  });
}

/// checks whether the annotated element is safe html
@immutable
class SafeHtml {
  final String message;
  const SafeHtml({
    this.message,
  });
}

/// Checks if the annotated element’s size is between [min] and [max] (inclusive)
@immutable
class Size {
  final int min;
  final int max;
  final String message;
  const Size({
    this.min,
    this.max,
    this.message,
  });
}

/// Checks that the annotated collection only contains unique elements.
/// The default message does not include the list of duplicate elements but
/// you can include it by overriding the message and using the {duplicates}
/// message parameter. The list of duplicate elements is also included in the
/// dynamic payload of the constraint violation.
@immutable
class UniqueElements {
  final String message;
  const UniqueElements({
    this.message,
  });
}

/// Checks if the annotated character sequence is a valid URL according to
/// RFC2396. If any of the optional parameters protocol, host or port are
/// specified, the corresponding URL fragments must match the specified values.
/// The optional parameters regexp and flags allow to specify an additional
/// regular expression (including regular expression flags) which the URL must
/// match.
@immutable
class URL {
  final String message;
  const URL({
    this.message,
  });
}

@immutable
class Valid {
  final String message;
  const Valid({
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
  UniqueElements,
  URL,
  Valid,
];
