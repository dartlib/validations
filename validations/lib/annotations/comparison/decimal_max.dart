part of annotations.comparison;

//// Checks whether the annotated value is less than the specified maximum,
//// when inclusive=false. Otherwise whether the value is less than or equal to
//// the specified maximum. The parameter value is the string representation of
//// the max value.
@immutable
class DecimalMax extends ValidatorAnnotation {
  final String value;
  final bool inclusive;
  const DecimalMax({
    @required this.value,
    this.inclusive = true,
    String message,
    List<String> groups,
  })  : assert(value != null),
        super(message, groups);
}
