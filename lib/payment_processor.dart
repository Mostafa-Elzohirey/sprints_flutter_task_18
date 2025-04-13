import 'dart:math' show Random;

import 'package:sprints_flutter_task_18/results.dart';

import 'details.dart';
import 'exceptions.dart';
import 'interfaces.dart';

class CashPaymentProcessor implements PaymentProcessor {
  final Set<String> supportedCurrencies = {'USD', 'EUR', 'GBP'};

  @override
  Future<PaymentResult> processPayment(PaymentDetails paymentDetails) async {
    try {
      _validatePayment(paymentDetails);
      print('Processing cash payment of ${paymentDetails.amount} ${paymentDetails.currency}');

      // Simulate processing delay
      await Future.delayed(Duration(seconds: 1));

      return PaymentResult(
        PaymentStatus.success,
        transactionId: 'CASH-${Random().nextInt(10000)}',
        message: 'Payment received in cash',
      );
    } on PaymentException catch (e) {
      print('Cash payment failed: $e');
      return PaymentResult(PaymentStatus.failed, message: e.toString());
    }
  }

  void _validatePayment(PaymentDetails paymentDetails) {
    if (paymentDetails.amount <= 0) {
      throw InvalidPaymentAmountException('Amount must be positive');
    }
    if (!supportedCurrencies.contains(paymentDetails.currency)) {
      throw CurrencyNotSupportedException(
          'Currency ${paymentDetails.currency} not supported for cash payments');
    }
  }
}