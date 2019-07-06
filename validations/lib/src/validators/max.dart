import 'package:meta/meta.dart';

import '../../validations.dart';
import '../validator/constraint_validator.dart';
import '../validator/value_context.dart';

class MaxValidator extends ConstraintValidator<Max> {
  final num value;

  MaxValidator({
    @required this.value,
  })  : assert(value != null),
        super([value]);

  @override
  bool isValid(dynamic value, [ValueContext context]) {
    if (!(value is num)) return false;

    return value <= this.value;
  }

  @override
  Function message = (num value, Object validatedValue) =>
      '$validatedValue should not be more than $value';
}
