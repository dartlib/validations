part of validators.comparison;

/// Checks whether the [value] is not equal to the value being tested.
///
/// Equality is based on the `!=` operator of the objects being compared.
///
/// Supported types: All types implementing the `!=` operator.
class NotEqualToValidator extends ConstraintValidator {
  final dynamic value;

  NotEqualToValidator({
    @required this.value,
  })  : assert(value != null),
        super([value]);

  @override
  bool isValid(dynamic value, [ValueContext context]) {
    return value != this.value;
  }

  @override
  Function message = (num value, Object validatedValue) =>
      '$validatedValue should not be equal to $value';
}
