part of validators.string;

/// Checks whether the value has a byte length between  $min and $max.
///
/// Supported types: [String]
class ByteLengthValidator extends ConstraintValidator {
  final int min;
  final int max;
  ByteLengthValidator({
    @required this.min,
    this.max,
  })  : assert(min != null),
        super([min, max]);
  @override
  bool isValid(dynamic value, ValueContext context) {
    return value is String && isByteLength(value, min, max);
  }

  @override
  Function message = (int min, int max, Object validatedValue) =>
      'Bytelength should be between $min and $max.';
}
