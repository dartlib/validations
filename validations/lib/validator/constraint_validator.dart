import 'value_context.dart';

abstract class ConstraintValidator {
  List argumentValues;

  /// null is allowed by default for every Constraint Validator.
  /// Set this to true
  bool notNull = false;

  ConstraintValidator([
    this.argumentValues = const [],
  ]);

  // Called each time before an isValid check.
  void initialize() {}

  bool isValid(Object value, ValueContext context);

  Function get message;
}
