part of validators.comparison;

class DecimalMinValidator extends ConstraintValidator {
  final bool inclusive;
  final String value;

  DecimalMinValidator({
    @required this.value,
    this.inclusive = false,
  })  : assert(value != null),
        super([value, inclusive]);

  @override
  bool isValid(dynamic value, [ValueContext context]) {
    Decimal decimal;

    if (value is String) {
      decimal = Decimal.parse(value);
    } else if (value is Decimal) {
      decimal = value;
    } else {
      return false;
    }

    if (inclusive) {
      return decimal >= Decimal.parse(this.value);
    }

    return decimal > Decimal.parse(this.value);
  }

  @override
  Function message = (String value, bool inclusive, Object validatedValue) =>
      inclusive
          ? '$validatedValue is smaller or equal to $value'
          : '$validatedValue is smaller than $value';
}
