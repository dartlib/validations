part of annotations.number;

//// Checks whether the annotated value is a number having up to [integer] digits
//// and [fraction] fractional digits.
@immutable
class Digits extends ValidatorAnnotation {
  /// maximum number of integral digits accepted for this number
  final int integer;

  /// maximum number of fractional digits accepted for this number
  final int fraction;
  const Digits({
    this.integer,
    this.fraction,
    String message,
    List<String> groups,
  }) : super(message, groups);
}
