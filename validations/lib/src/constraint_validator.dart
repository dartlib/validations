import 'validator_context.dart';

abstract class ConstraintValidator<T> {
  List argumentValues;

  /// null is allowed by default for every Constraint Validator.
  /// Set this to true
  bool notNull = false;

  ConstraintValidator([
    this.argumentValues = const [],
  ]);
  bool isValid(Object value, ValueContext context);

  Function get message;
}
