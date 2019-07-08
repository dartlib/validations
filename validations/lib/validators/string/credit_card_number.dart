part of validators.string;

class CreditCardNumberValidator extends ConstraintValidator {
  @override
  bool isValid(Object value, [ValueContext context]) {
    return value is String && isCreditCard(value);
  }

  @override
  Function message = (Object validatedValue) => 'Creditcard is invalid';
}
