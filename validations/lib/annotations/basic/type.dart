part of annotations.basic;

//// Checks whether the annotated element is of a specific [Type]
@immutable
class Type extends ValidatorAnnotation {
  final Object type;
  const Type({
    this.type,
    String message,
    List<String> groups,
  }) : super(message, groups);
}
