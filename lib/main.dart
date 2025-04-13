import 'payment_processor.dart';
import 'card_details.dart';
import 'card_payment_processor.dart';
import 'details.dart';
import 'interfaces.dart';
import 'payment_service.dart';

void main() async {
  final cashProcessor = CashPaymentProcessor();
  final cashService = PaymentService(cashProcessor);

  var result = await cashService.executePayment(100.00, 'USD');
  print('Cash payment result: $result');

  result = await cashService.executePayment(100.00, 'JPY');
  print('Cash payment result: $result');

  final cardDetails = CreditCardDetails(
    cardNumber: '4111111111111111',
    expirationDate: '12/25',
    cvv: '123',
    cardholderName: 'John Doe',
  );

  final creditProcessor = CreditCardPaymentProcessor(cardDetails);
  final creditService = PaymentService(creditProcessor);

  result = await creditService.executePayment(150.50, 'EUR');
  print('Credit card payment result: $result');

  if (creditProcessor is RefundProcessor) {
    result = await creditProcessor.processRefund(PaymentDetails(50.25, 'EUR'));
    print('Credit card refund result: $result');
  }
}
