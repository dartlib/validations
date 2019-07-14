part of validators.comparison;

/// Checks whether the [value] is equal to the value being tested.
///
/// Equality is based on the `==` operator of the objects being compared.
///
/// Supported types: All types implementing the `==` operator.
class EqualToValidator extends ConstraintValidator {
  final dynamic value;

  EqualToValidator({
    @required this.value,
  })  : assert(value != null),
        super([value]);

  @override
  bool isValid(dynamic value, [ValueContext context]) {
    return value == this.value;
  }

  @override
  Function message = (num value, Object validatedValue) =>
      '$validatedValue should be equal to $value';
}
