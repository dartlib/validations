part of annotations.comparison;

/// Checks whether the annotated value is less than the specified value.
@immutable
@Constraint(validatedBy: LessThanValidator)
@Target({ElementType.FIELD})
class LessThan extends ValidatorAnnotation {
  final num value;
  const LessThan({
    @required this.value,
    String message,
    List<String> groups,
  }) : super(message, groups);
}
