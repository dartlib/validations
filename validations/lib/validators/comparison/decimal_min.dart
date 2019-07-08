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
  bool isValid(dynamic object, [ValueContext context]) {
    Decimal value;

    if (object is String) {
      value = Decimal.parse(object);
    } else if (object is Decimal) {
      value = object;
    } else {
      return false;
    }

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
