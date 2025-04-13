import 'details.dart';

class PaymentResult {
  final PaymentStatus status;
  final String? transactionId;
  final String? message;

  PaymentResult(this.status, {this.transactionId, this.message});

  @override
  String toString() {
    return 'PaymentResult{status: $status, transactionId: $transactionId, message: $message}';
  }
}