part of annotations.date;

//// Checks whether the annotated date is in the present or in the future
@immutable
class FutureOrPresent extends ValidatorAnnotation {
  const FutureOrPresent({
    String message,
    List<String> groups,
  }) : super(message, groups);
}
