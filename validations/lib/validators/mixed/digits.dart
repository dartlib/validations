part of validators.mixed;

const maxFraction = 20;

class DigitsValidator extends ConstraintValidator {
  final int integer;
  final int fraction;

  DigitsValidator({
    @required this.integer,
    this.fraction = 0,
  }) : super([integer, fraction]) {
    if (integer == null) {
      throw ArgumentError('Integer is required');
    }

    if (integer != null && integer.isNegative) {
      throw ArgumentError('Integer cannot be negative');
    }

    if (fraction != null && fraction.isNegative) {
      throw ArgumentError('Fraction cannot be negative');
    }

    if (fraction > maxFraction) {
      throw ArgumentError('Fraction cannot be larger than $maxFraction');
    }
  }

  @override
  bool isValid(dynamic value, [ValueContext context]) {
    Decimal decimal;

    if (value is String) {
      decimal = Decimal.parse(value);
    } else if (value is Decimal) {
      decimal = value;
    } else {
      throw Exception('Value should be a string or Decimal');
    }

    final after = decimal.scale;
    final before = decimal.precision - after;

    return before <= integer && after <= fraction;
  }

  @override
  Function message = (int integer, int fraction, Object validatedValue) =>
      '$validatedValue should have $integer integers and $fraction fractions';
}
