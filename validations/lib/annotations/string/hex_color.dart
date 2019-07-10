part of annotations.string;

//// Checks that the annotated character sequence is a valid hex color.
@immutable
class HexColor extends ValidatorAnnotation {
  const HexColor({
    message,
    groups,
  }) : super(message, groups);
}
