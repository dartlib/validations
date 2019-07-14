part of validators.comparison;

/// Checks if the value being tested is less than or equal to [value].
///
/// Supported types: All values implementing the `<=` operator.
class LessThanOrEqualValidator extends ConstraintValidator {
  final dynamic value;

  LessThanOrEqualValidator({
    @required this.value,
  })  : assert(value != null),
        super([value]);

  @override
  bool isValid(dynamic value, [ValueContext context]) {
    try {
      return value <= this.value as bool;
    } catch (_) {
      return false;
    }
  }

  @override
  Function message = (num value, Object validatedValue) =>
      '$validatedValue should be less than or equal to $value';
}
