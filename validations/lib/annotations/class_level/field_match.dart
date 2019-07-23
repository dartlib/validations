part of annotations.class_level;

@immutable
@Constraint(validatedBy: FieldMatchValidator)
@Target({ElementType.CLASS})
class FieldMatch extends ValidatorAnnotation {
  @property
  final String baseField;

  @property
  final String matchField;

  @errorMessage
  final String baseFieldMessage;

  @errorMessage
  final String matchFieldMessage;

  const FieldMatch({
    this.baseField,
    this.matchField,
    this.baseFieldMessage,
    this.matchFieldMessage,
    String message,
    List<String> groups,
  }) : super(message, groups);
}
