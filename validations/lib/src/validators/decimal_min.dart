import 'package:decimal/decimal.dart';
import 'package:meta/meta.dart';

import '../../validations.dart';
import '../validator/constraint_validator.dart';
import '../validator/value_context.dart';

class DecimalMinValidator extends ConstraintValidator<DecimalMin> {
  final bool inclusive;
  final String value;

  DecimalMinValidator({
    @required this.value,
    this.inclusive = false,
  })  : assert(value != null),
        super([value, inclusive]);

  @override
  bool isValid(dynamic value, [ValueContext context]) {
    if (!(value is Decimal)) return false;

    if (inclusive) {
      return value >= Decimal.parse(this.value);
    }

    return value > Decimal.parse(this.value);
  }

  @override
  Function message = (String value, bool inclusive, Object validatedValue) =>
      inclusive
          ? '$validatedValue is smaller or equal to $value'
          : '$validatedValue is smaller than $value';
}
