part of annotations.string;

//// Checks that the annotated character sequence is a valid EAN barcode.
//// [type] determines the type of barcode. The default is EAN-13.
@immutable
class EAN {
  final String message;
  final String type;
  const EAN({
    this.message,
    this.type = 'EAN-13',
  });
}
