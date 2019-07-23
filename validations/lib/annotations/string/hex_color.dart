part of annotations.string;

/// Checks that the annotated string is a valid hex color.
@immutable
@Constraint(validatedBy: HexColorValidator)
@Target({ElementType.FIELD})
class HexColor extends ValidatorAnnotation {
  const HexColor({
    String message,
    List<String> groups,
  }) : super(message, groups);
}
