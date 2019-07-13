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
    if (value is Iterable) {
      return _compare(value.length);
    }

    if (value is Map) {
      return _compare(value.length);
    }

    if (value is String) {
      return _compare(value.length);
    }

    if (value is num) {
      return _compare(value);
    }

    return false;
  }

  bool _compare(num value) {
    return value >= min && value <= max;
  }

  @override
  Function message = (num min, num max, Object validatedValue) =>
      '$validatedValue should be between $min and $max';
}
