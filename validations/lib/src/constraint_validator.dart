import 'validator_context.dart';

abstract class ConstraintValidator<T> {
  List argumentValues;

  ConstraintValidator([
    this.argumentValues = const [],
  ]);
  bool isValid(Object value, ValidatorContext context);

  Function get message;
}
