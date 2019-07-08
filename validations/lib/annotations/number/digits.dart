part of annotations.number;

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
