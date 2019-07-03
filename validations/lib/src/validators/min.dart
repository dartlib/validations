import 'package:meta/meta.dart';

import '../../validations.dart';
import '../constraint_validator.dart';
import '../validator_context.dart';

class MinValidator extends ConstraintValidator<Min> {
  final double value;

  MinValidator({
    @required this.value,
  })  : assert(value != null),
        super([value]);

  @override
  bool isValid(dynamic value, [ValidatorContext context]) {
    if (!(value is int || value is double)) return false;

    return value >= this.value;
  }

  @override
  Function message = (double value, Object validatedValue) =>
      '$validatedValue should not be less than $value';
}
