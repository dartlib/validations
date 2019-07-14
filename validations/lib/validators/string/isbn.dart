part of validators.string;

/// Checks if the value is a valid ISBN number.
///
/// Supported types: [String]
class ISBNValidator extends ConstraintValidator {
  final int version;

  ISBNValidator({this.version}) : super([version]);

  @override
  bool isValid(dynamic value, [ValueContext context]) {
    return value is String && isISBN(value, version);
  }

  @override
  Function message = (int version, Object validatedValue) => 'ISBN is invalid.';
}
