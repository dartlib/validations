part of annotations.comparison;

/// Checks whether the annotated value is higher than the specified value.
@immutable
@Constraint(validatedBy: GreaterThanValidator)
@Target({ElementType.FIELD})
class GreaterThan extends ValidatorAnnotation {
  final num value;
  const GreaterThan({
    @required this.value,
    String message,
    List<String> groups,
  }) : super(message, groups);
}
