part of annotations.string;

/// Checks that the annotated string is a valid hexadecimal.
@immutable
@Constraint(validatedBy: HexadecimalValidator)
class Hexadecimal extends ValidatorAnnotation {
  const Hexadecimal({
    String message,
    List<String> groups,
  }) : super(message, groups);
}
