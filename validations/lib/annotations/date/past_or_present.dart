part of annotations.date;

//// Checks whether the annotated date is in the past or in the present
@immutable
class PastOrPresent extends ValidatorAnnotation {
  const PastOrPresent({
    message,
    groups,
  }) : super(message, groups);
}
