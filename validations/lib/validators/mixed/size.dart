part of validators.mixed;

/// Checks that the length or value is between [min] and [max].
///
///  Supported types: [String], [Iterable], [Map], [num]
class SizeValidator extends ConstraintValidator {
  final int max;
  final int min;

  SizeValidator({
    @required this.min,
    @required this.max,
  })  : assert(min != null),
        assert(max != null),
        super([min, max]);

  @override
  bool isValid(dynamic value, [ValueContext context]) {
    if (value is String || value is Iterable || value is Map) {
      return min <= (value.length as int) && (value.length as int) <= max;
    }

    if (value is num) {
      return min <= value && value <= max;
    }

    return false;
  }

  @override
  Function message = (int min, int max, Object validatedValue) =>
      '$validatedValue is not between $min and $max';
}
