part of annotations.string;

/// Checks that the annotated string passes the Luhn checksum test.
@immutable
@Constraint(validatedBy: CreditCardNumberValidator)
class CreditCardNumber extends ValidatorAnnotation {
  const CreditCardNumber({
    String message,
    List<String> groups,
  }) : super(message, groups);
}
