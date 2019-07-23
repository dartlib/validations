part of annotations.comparison;

/// Checks whether the annotated value is larger than the specified minimum,
/// when inclusive=false. Otherwise whether the value is larger than or equal to
/// the specified minimum. The parameter value is the string representation of
/// the min value.
@immutable
@Constraint(validatedBy: DecimalMinValidator)
class DecimalMin extends ValidatorAnnotation {
  final String value;
  final bool inclusive;
  const DecimalMin({
    @required this.value,
    this.inclusive = true,
    String message,
    List<String> groups,
  })  : assert(value != null),
        super(message, groups);
}
