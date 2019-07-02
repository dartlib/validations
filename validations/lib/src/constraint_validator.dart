import 'validator_context.dart';

abstract class ConstraintValidator<T> {
  bool isValid(Object value, ValidatorContext context);

  Function get message;
}
