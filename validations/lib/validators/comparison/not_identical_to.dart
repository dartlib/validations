part of validators.comparison;

/// Checks whether the value being tested is not identical to [value]
///
/// Equality is checked by the [identical] function.
///
/// This means both values should *not* share the same reference.
class NotIdenticalToValidator extends ConstraintValidator {
  final dynamic value;

  NotIdenticalToValidator({
    @required this.value,
  })  : assert(value != null),
        super([value]);

  @override
  bool isValid(dynamic value, ValueContext context) {
    return !identical(value, this.value);
  }

  @override
  Function message = (dynamic value, Object validatedValue) =>
      '$validatedValue should not be identical to $value';
}
