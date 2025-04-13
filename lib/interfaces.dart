import 'results.dart';
import 'details.dart';

abstract class PaymentProcessor {
  Future<PaymentResult> processPayment(PaymentDetails paymentDetails);
}

abstract class RefundProcessor {
  Future<PaymentResult> processRefund(PaymentDetails paymentDetails);
}
