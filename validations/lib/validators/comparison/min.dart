part of validators.comparison;

/// Checks if the value being tested is greater than or equal to [value].
///
/// Supported types: All values implementing the `>=` operator.
///
/// Note: this validator is identical to the [GreaterThanOrEqualValidator].
class MinValidator extends GreaterThanOrEqualValidator {
  MinValidator({
    @required num value,
  })  : assert(value != null),
        super(value: value);

  @override
  Function message =
      (dynamic value, Object validatedValue) => 'The minimum value is $value';
}
