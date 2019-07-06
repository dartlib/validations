import 'package:decimal/decimal.dart';
import 'package:meta/meta.dart';

import '../../validations.dart';
import '../validator/constraint_validator.dart';
import '../validator/value_context.dart';

class DecimalMaxValidator extends ConstraintValidator<DecimalMax> {
  final dynamic value;
  final bool inclusive;

  DecimalMaxValidator({
    @required this.value,
    this.inclusive = false,
  })  : assert(value != null),
        super([value, inclusive]);

  @override
  bool isValid(dynamic value, [ValueContext context]) {
    if (!(value is Decimal)) return false;

    if (inclusive) {
      return value <= Decimal.parse(this.value);
    }

    return value < Decimal.parse(this.value);
  }

  @override
  Function message = (String value, bool inclusive, Object validatedValue) =>
      inclusive
          ? '$validatedValue is greater or equal to $value'
          : '$validatedValue is greater than $value';
}
