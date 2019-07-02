import 'validator_context.dart';

abstract class ConstraintValidator<T> {
  String message = 'No error message defined.';
  String messageTemplate = '';
  T params;
  void initialize() async {}

  bool isValid(Object value, ValidatorContext context);

  void setMessage(String message) {
    this.message = message;
  }

  void setMessageTemplate(String messageTemplate) {
    this.messageTemplate = messageTemplate;
  }
}
