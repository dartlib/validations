part of validators.comparison;

/// Check that the value being validated represents a [Decimal] number.
/// and has a value less than or equal to the maximum value specified.
///
/// Supported type: [Decimal] and [String]
class DecimalMaxValidator extends ConstraintValidator {
  final String value;
  final bool inclusive;

  DecimalMaxValidator({
    @required this.value,
    this.inclusive = false,
  })  : assert(value != null),
        super([value, inclusive]);

  @override
  bool isValid(dynamic value, ValueContext context) {
    Decimal decimal;

    if (value is String) {
      decimal = Decimal.parse(value);
    } else if (value is Decimal) {
      decimal = value;
    } else {
      return false;
    }

    if (inclusive) {
      return decimal <= Decimal.parse(this.value);
    }

    return decimal < Decimal.parse(this.value);
  }

  @override
  Function message = (String value, bool inclusive, Object validatedValue) =>
      inclusive
          ? '$validatedValue is greater or equal to $value'
          : '$validatedValue is greater than $value';
}
