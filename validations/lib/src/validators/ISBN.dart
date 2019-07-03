import 'package:validators/validators.dart' show isISBN;

import '../../validations.dart';
import '../constraint_validator.dart';
import '../validator_context.dart';

class ISBNValidator extends ConstraintValidator<ISBN> {
  final int version;

  ISBNValidator({this.version});

  @override
  bool isValid(dynamic value, ValidatorContext context) {
    return isISBN(value, version);
  }

  @override
  Function message = (String value, int version) => 'ISBN is invalid.';
}
