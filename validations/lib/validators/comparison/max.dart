part of validators.comparison;

/// Checks if the value being tested is less than or equal to [value].
///
/// Supported types: All values implementing the `<=` operator.
///
/// Note: this validator is identical to the [LessThanOrEqualValidator]
class MaxValidator extends LessThanOrEqualValidator {
  MaxValidator({
    @required num value,
  })  : assert(value != null),
        super(value: value);
}
