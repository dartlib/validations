part of annotations.comparison;

/// Checks that annotated Duration element is not less than the one
/// constructed from annotation parameters. Equality is allowed if inclusive
/// flag is set to true.
@immutable
@Constraint(validatedBy: DurationMinValidator)
@Target({ElementType.FIELD})
class DurationMin extends ValidatorAnnotation {
  final int days;
  final int hours;
  final int minutes;
  final int seconds;
  final int milliseconds;
  final int microseconds;
  final bool inclusive;
  const DurationMin({
    this.days,
    this.hours,
    this.minutes,
    this.seconds,
    this.milliseconds,
    this.microseconds,
    this.inclusive,
    String message,
    List<String> groups,
  }) : super(message, groups);
}
