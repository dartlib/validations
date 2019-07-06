import 'package:validators/validators.dart' show isISBN;

import '../../validations.dart';
import '../validator/constraint_validator.dart';
import '../validator/value_context.dart';

class ISBNValidator extends ConstraintValidator<ISBN> {
  final int version;

  ISBNValidator({this.version}) : super([version]);

  @override
  bool isValid(dynamic value, [ValueContext context]) {
    return isISBN(value, version);
  }

  @override
  Function message = (int version, Object validatedValue) => 'ISBN is invalid.';
}
