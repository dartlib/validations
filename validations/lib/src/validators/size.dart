import 'package:meta/meta.dart';

import '../../validations.dart';
import '../constraint_validator.dart';
import '../validator_context.dart';

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
  bool isValid(dynamic value, [ValidatorContext context]) {
    if (value is String || value is List || value is Map) {
      return min <= value.length && value.length <= max;
    }

    return false;
  }

  @override
  Function message = (int min, int max, Object validatedValue) =>
      '$validatedValue is not between $min and $max';
}
