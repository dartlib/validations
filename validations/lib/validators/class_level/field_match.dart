part of validators.class_level;

typedef _FieldMatchMessage = String Function(
  String baseField,
  String matchField,
  Object validatedValue,
);

/// Check that the [baseField] matches the [matchField].
///
/// If [matchField] is still empty the validator will report
/// both fields as valid.
///
/// Use the field level annotations @notEmpty or @notNull
/// on the validated fields to prevent the validness of this state.
class FieldMatchValidator<ValueType>
    extends ClassConstraintValidator<ValueType> {
  final String baseField;
  final String matchField;
  FieldMatchValidator({
    this.baseField,
    this.matchField,
  }) : super([baseField, matchField]);
  @override
  bool isValid(PropertyMap<ValueType> value, ValueContext context) {
    final baseValue = value[baseField];
    final matchValue = value[matchField];

    final result =
        baseValue == matchValue || matchValue == '' || matchValue == null;

    if (!result) {
      context
        ..addViolation(
          baseFieldMessage,
          [baseField, matchField, value],
          context.getNode(baseField),
        )
        ..addViolation(
          matchFieldMessage,
          [baseField, matchField, value],
          context.getNode(matchField),
        );
    }

    return result;
  }

  _FieldMatchMessage baseFieldMessage =
      (String baseField, String matchField, Object validatedValue) =>
          'Fields $baseField and $matchField should match';

  _FieldMatchMessage matchFieldMessage =
      (String baseField, String matchField, Object validatedValue) =>
          'Fields $baseField and $matchField should match';
}
