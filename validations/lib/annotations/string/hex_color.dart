part of annotations.string;

/// Checks that the annotated character sequence is a valid hex color.
@immutable
class HexColor {
  final String message;
  const HexColor({
    this.message,
  });
}
