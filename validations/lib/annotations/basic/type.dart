part of annotations.basic;

/// Checks whether the annotated element is of the declared type
@immutable
class Type extends ValidatorAnnotation {
  const Type({
    String message,
    List<String> groups,
  }) : super(message, groups);
}
