part of annotations.comparison;

/// Checks that annotated Duration element is not greater than the one
/// constructed from annotation parameters. Equality is allowed if inclusive
/// flag is set to true.
///
@immutable
class DurationMax extends ValidatorAnnotation {
  final int days;
  final int hours;
  final int minutes;
  final int seconds;
  final int milliseconds;
  final int microseconds;
  final bool inclusive;

  const DurationMax({
    this.days = 0,
    this.hours = 0,
    this.minutes = 0,
    this.seconds = 0,
    this.milliseconds = 0,
    this.microseconds = 0,
    this.inclusive,
    String message,
    List<String> groups,
  }) : super(message, groups);
}
