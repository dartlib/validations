part of annotations.string;

/// Checks that the annotated string is a valid hex color.
@immutable
class HexColor extends ValidatorAnnotation {
  const HexColor({
    String message,
    List<String> groups,
  }) : super(message, groups);
}
