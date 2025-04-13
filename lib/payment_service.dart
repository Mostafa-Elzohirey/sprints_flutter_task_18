import 'details.dart';
import 'interfaces.dart';
import 'results.dart';

class PaymentService {
  final PaymentProcessor paymentProcessor;

  PaymentService(this.paymentProcessor);

  Future<PaymentResult> executePayment(double amount, String currency) async {
    final paymentDetails = PaymentDetails(amount, currency);
    return await paymentProcessor.processPayment(paymentDetails);
  }
}
