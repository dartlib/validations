part of annotations.money;

@immutable
class Currency extends ValidatorAnnotation {
  const Currency({
    message,
    groups,
  }) : super(message, groups);
}
