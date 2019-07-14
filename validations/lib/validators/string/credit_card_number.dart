part of validators.string;

/// Checks whether the value is a valid credit card number.
///
/// Supported types: [String]
class CreditCardNumberValidator extends ConstraintValidator {
  @override
  bool isValid(Object value, [ValueContext context]) {
    return value is String && isCreditCard(value);
  }

  @override
  Function message = (Object validatedValue) => 'Creditcard is invalid';
}
