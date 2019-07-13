part of validators.comparison;

class RangeValidator extends ConstraintValidator {
  final dynamic min;
  final dynamic max;

  RangeValidator({
    @required this.min,
    @required this.max,
  })  : assert(min != null),
        assert(max != null),
        super([min, max]);

  @override
  bool isValid(dynamic value, [ValueContext context]) {
    try {
      return value >= min as bool && value <= max as bool;
    } catch (_) {
      return false;
    }
  }

  @override
  Function message = (num min, num max, Object validatedValue) =>
      '$validatedValue should be between $min and $max';
}
