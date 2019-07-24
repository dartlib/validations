part of validators.comparison;

/// Checks whether the value being tested is identical to [value]
///
/// Equality is checked by the [identical] function.
///
/// This means both values should share the same reference.
class IdenticalToValidator extends ConstraintValidator {
  final dynamic value;

  IdenticalToValidator({
    @required this.value,
  })  : assert(value != null),
        super([value]);

  @override
  bool isValid(dynamic value, ValueContext context) {
    return identical(value, this.value);
  }

  @override
  Function message = (dynamic value, Object validatedValue) =>
      '$validatedValue should be identical to $value';
}
