part of annotations.date;

//// Checks whether the annotated date is in the present or in the future
@immutable
class FutureOrPresent extends ValidatorAnnotation {
  const FutureOrPresent({
    message,
    groups,
  }) : super(message, groups);
}
