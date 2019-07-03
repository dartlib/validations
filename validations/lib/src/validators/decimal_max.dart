import 'package:decimal/decimal.dart';

import '../../validations.dart';
import '../constraint_validator.dart';
import '../validator_context.dart';

class DecimalMaxValidator extends ConstraintValidator<DecimalMax> {
  final bool inclusive;
  final String value;

  DecimalMaxValidator({
    this.value,
    this.inclusive,
  });

  @override
  bool isValid(dynamic value, ValidatorContext context) {
    if (!value is String) return false;

    if (inclusive) {
      return Decimal.parse(value) <= Decimal.parse(this.value);
    }

    return Decimal.parse(value) < Decimal.parse(this.value);
  }

  @override
  Function message = (String max, String value, bool inclusive) => inclusive
      ? '$value is greater or equal to $max'
      : '$value is greater than $max';
}
