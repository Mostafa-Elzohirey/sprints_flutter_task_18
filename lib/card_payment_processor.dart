import 'dart:math';

import 'exceptions.dart';
import 'results.dart';

import 'card_details.dart';
import 'details.dart';
import 'interfaces.dart';

class CreditCardPaymentProcessor implements PaymentProcessor, RefundProcessor {
  final CreditCardDetails cardDetails;

  CreditCardPaymentProcessor(this.cardDetails);

  @override
  Future<PaymentResult> processPayment(PaymentDetails paymentDetails) async {
    try {
      _validatePayment(paymentDetails);
      print(
          'Processing credit card payment of ${paymentDetails.amount} ${paymentDetails.currency}');
      print(
          'Card: ${cardDetails.cardNumber.substring(cardDetails.cardNumber.length - 4)}');

      // Simulate processing delay
      await Future.delayed(Duration(seconds: 2));

      return PaymentResult(
        PaymentStatus.success,
        transactionId: 'CC-${Random().nextInt(10000)}',
        message: 'Credit card payment processed',
      );
    } on PaymentException catch (e) {
      print('Credit card payment failed: $e');
      return PaymentResult(PaymentStatus.failed, message: e.toString());
    }
  }

  @override
  Future<PaymentResult> processRefund(PaymentDetails paymentDetails) async {
    try {
      _validateRefund(paymentDetails);
      print(
          'Processing refund to credit card of ${paymentDetails.amount} ${paymentDetails.currency}');
      print(
          'Card: ${cardDetails.cardNumber.substring(cardDetails.cardNumber.length - 4)}');

      // Simulate processing delay
      await Future.delayed(Duration(seconds: 2));

      return PaymentResult(
        PaymentStatus.success,
        transactionId: 'REFUND-${Random().nextInt(10000)}',
        message: 'Refund processed',
      );
    } on PaymentException catch (e) {
      print('Refund failed: $e');
      return PaymentResult(PaymentStatus.failed, message: e.toString());
    }
  }

  void _validatePayment(PaymentDetails paymentDetails) {
    if (paymentDetails.amount <= 0) {
      throw InvalidPaymentAmountException('Amount must be positive');
    }
  }

  void _validateRefund(PaymentDetails paymentDetails) {
    if (paymentDetails.amount <= 0) {
      throw InvalidPaymentAmountException('Refund amount must be positive');
    }
  }
}
