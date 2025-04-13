enum PaymentStatus { success, failed, pending }

class PaymentDetails {
  final double amount;
  final String currency;

  PaymentDetails(this.amount, this.currency);
}