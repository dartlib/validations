part of annotations.class_level;

@immutable
@Target({ElementType.CLASS})
class FieldMatch extends ValidatorAnnotation {
  @property
  final String baseField;
  @property
  final String matchField;
  const FieldMatch({
    this.baseField,
    this.matchField,
    String message,
    List<String> groups,
  }) : super(message, groups);
}
