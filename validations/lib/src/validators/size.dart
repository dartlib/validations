import 'package:meta/meta.dart';

import '../../validations.dart';
import '../validator/constraint_validator.dart';
import '../validator/value_context.dart';

class SizeValidator extends ConstraintValidator<Size> {
  final int max;
  final int min;

  SizeValidator({
    @required this.min,
    @required this.max,
  })  : assert(min != null),
        assert(max != null),
        super([min, max]);

  @override
  bool isValid(dynamic value, [ValueContext context]) {
    if (value is String || value is List || value is Map) {
      return min <= value.length && value.length <= max;
    }

    if (value is num) {
      return min <= value && value <= max;
    }

    return false;
  }

  @override
  Function message = (int min, int max, Object validatedValue) =>
      '$validatedValue is not between $min and $max';
}
