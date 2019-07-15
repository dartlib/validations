part of annotations.string;

/// Checks that the annotated string is a valid EAN barcode.
///
/// [type] determines the type of barcode. The default is EAN-13.
@immutable
class EAN extends ValidatorAnnotation {
  final String type;
  const EAN({
    this.type = 'EAN-13',
    String message,
    List<String> groups,
  }) : super(message, groups);
}
