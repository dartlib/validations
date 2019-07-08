part of annotations.comparison;

/// Checks that annotated Duration element is not less than the one
/// constructed from annotation parameters. Equality is allowed if inclusive
/// flag is set to true.
@immutable
class DurationMin extends ValidatorAnnotation {
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
    message,
    groups,
  }) : super(message, groups);
}
