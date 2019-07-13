part of annotations.mixed;

/// Checks whether the annotated value is a number having up to [integer] digits
/// and [fraction] fractional digits.
@immutable
class Digits extends ValidatorAnnotation {
  /// maximum number of integral digits accepted for this number
  final int integer;

  /// maximum number of fractional digits accepted for this number
  final int fraction;
  Digits({
    this.integer,
    this.fraction,
    String message,
    List<String> groups,
  }) : super(message, groups) {
    if (integer.isNegative) {
      throw ArgumentError('Integer cannot be negative');
    }

    if (fraction.isNegative) {
      throw ArgumentError('Fraction cannot be negative');
    }
  }
}
