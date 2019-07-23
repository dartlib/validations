part of annotations.date;

/// Checks whether the annotated date is in the past or in the present
@immutable
@Constraint(validatedBy: PastOrPresentValidator)
class PastOrPresent extends ValidatorAnnotation {
  final Object timeUnit;
  const PastOrPresent({
    this.timeUnit,
    String message,
    List<String> groups,
  }) : super(message, groups);
}
