part of annotations.money;

@immutable
class Currency extends ValidatorAnnotation {
  const Currency({
    String message,
    List<String> groups,
  }) : super(message, groups);
}
