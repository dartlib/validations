part of annotations.date;

//// Checks whether the annotated date is in the past or in the present
@immutable
class PastOrPresent extends ValidatorAnnotation {
  const PastOrPresent({
    String message,
    List<String> groups,
  }) : super(message, groups);
}
