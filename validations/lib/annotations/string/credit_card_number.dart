part of annotations.string;

//// Checks that the annotated character sequence passes the Luhn checksum test.
@immutable
class CreditCardNumber extends ValidatorAnnotation {
  const CreditCardNumber({
    message,
    groups,
  }) : super(message, groups);
}
