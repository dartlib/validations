import 'value_context.dart';

abstract class ConstraintValidator {
  List argumentValues;

  /// null is allowed by default for every Constraint Validator.
  /// Set this to true
  bool notNull = false;

  bool initialized = false;

  ConstraintValidator([
    this.argumentValues = const [],
  ]);

  // Called once after the constraint validator is first constructed.
  // Use this to do any initialization which is not possible to do from
  // the constructor.
  void initialize() {}

  bool isValid(Object value, ValueContext context);

  Function get message;
}
