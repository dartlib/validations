part of validator;

abstract class ConstraintValidator<ValueType> {
  List argumentValues;

  /// null is allowed by default for every Constraint Validator.
  /// Set this to true
  bool allowNull = true;

  ConstraintValidator([
    this.argumentValues = const [],
  ]);

  // Called each time before an isValid check.
  void initialize() {}

  bool validate(Object value, [ValueContext context]) {
    if (allowNull && value == null) return true;

    return isValid(value, context);
  }

  bool isValid(Object value, [ValueContext context]);

  Function get message;
}
