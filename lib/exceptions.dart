class PaymentException implements Exception {
  final String message;
  PaymentException(this.message);

  @override
  String toString() => 'PaymentException: $message';
}

class InvalidPaymentAmountException extends PaymentException {
  InvalidPaymentAmountException(super.message);
}

class CurrencyNotSupportedException extends PaymentException {
  CurrencyNotSupportedException(super.message);
}