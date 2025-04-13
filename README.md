# Payment Processing System

This project implements a payment processing system that supports cash and credit card payments. It includes functionality for processing payments and refunds, along with error handling for invalid payment scenarios.

## Table of Contents

- [Features](#features)
- [Getting Started](#getting-started)
- [File Structure](#file-structure)
- [Error Handling](#error-handling)
- [License](#license)

## Features

- Supports cash payments in multiple currencies (USD, EUR, GBP).
- Supports credit card payments with validation.
- Refund processing for credit card payments.
- Error handling for invalid payment amounts and unsupported currencies.

## Getting Started

To run this project, ensure you have Dart SDK installed. Clone the repository and navigate to the project directory. Use the following command to run the application:

```bash
dart run main.dart
```

## File Structure

```
/project-root
│
├── main.dart                # Entry point of the application
├── details.dart             # Contains PaymentDetails and PaymentStatus enums
├── results.dart             # Defines PaymentResult class for payment outcomes
├── card_details.dart        # Contains CreditCardDetails class for card information
├── exceptions.dart          # Custom exceptions for payment processing
├── interfaces.dart          # Abstract classes for PaymentProcessor and RefundProcessor
├── payment_processor.dart    # Implements CashPaymentProcessor for cash payments
├── card_payment_processor.dart # Implements CreditCardPaymentProcessor for credit card payments
└── payment_service.dart      # Service class to execute payments
```
## Error Handling

The system includes custom exceptions for handling errors:

- `PaymentException`: Base class for all payment-related exceptions.
- `InvalidPaymentAmountException`: Thrown when the payment amount is invalid.
- `CurrencyNotSupportedException`: Thrown when the currency is not supported for cash payments.

## License

This project is licensed under the MIT License. See the LICENSE file for details.