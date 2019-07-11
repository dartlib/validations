part of validators.string;

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
