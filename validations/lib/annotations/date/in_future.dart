part of annotations.date;

/// Checks whether the annotated date is in the future
@immutable
@Constraint(validatedBy: InFutureValidator)
class InFuture extends ValidatorAnnotation {
  final Object timeUnit;
  const InFuture({
    this.timeUnit,
    String message,
    List<String> groups,
  }) : super(message, groups);
}
