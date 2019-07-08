part of validators.comparison;

class DecimalMaxValidator extends ConstraintValidator {
  final dynamic value;
  final bool inclusive;

  DecimalMaxValidator({
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
