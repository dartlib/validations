part of annotations.string;

/// Checks that the annotated character sequence passes the Luhn checksum test.
@immutable
class CreditCardNumber {
  final String message;
  const CreditCardNumber({
    this.message,
  });
}
