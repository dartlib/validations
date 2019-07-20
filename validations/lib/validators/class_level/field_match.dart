part of validators.class_level;

/// Check that the [baseField] matches the [matchField].
///
/// If [matchField] is still empty the validator will report
/// both fields as valid.
///
/// Use the field level annotations @notEmpty or @notNull
/// on the validated fields to prevent the validness of this state.
class FieldMatchValidator<ValueType> extends ConstraintValidator<ValueType> {
  final String baseField;
  final String matchField;
  FieldMatchValidator({
    this.baseField,
    this.matchField,
  }) : super([baseField, matchField]);
  @override
  bool isValid(ValueType value, ValueContext context) {
    final props = context.validator.props(value);

    final baseValue = props[baseField];
    final matchValue = props[matchField];

    return baseValue == matchValue || matchValue == '' || matchValue == null;
  }

  @override
  Function message =
      (Set<String> fields, Object validatedValue) => 'Fields must match';
}
