part of validators.comparison;

class RangeValidator extends ConstraintValidator {
  final num min;
  final num max;

  RangeValidator({
    @required this.min,
    @required this.max,
  })  : assert(min != null),
        assert(max != null),
        super([min, max]);

  @override
  bool isValid(dynamic value, [ValueContext context]) {
    if (!(value is num)) return false;

    return value >= min as bool && value <= max as bool;
  }

  @override
  Function message = (num min, num max, Object validatedValue) =>
      '$validatedValue should be between $min and $max';
}
