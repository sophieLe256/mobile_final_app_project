import 'package:flutter/material.dart';

enum PaymentMethod { card, paypal, applePay, googlePay }

class PaymentMethodsPage extends StatefulWidget {
  @override
  _PaymentMethodsPageState createState() => _PaymentMethodsPageState();
}

class _PaymentMethodsPageState extends State<PaymentMethodsPage> {
  PaymentMethod _selectedMethod = PaymentMethod.card; // Default to card

  Widget _buildPaymentOption({
    required String title,
    required PaymentMethod method,
    required String assetName,
  }) {
    return RadioListTile<PaymentMethod>(
      title: Text(title),
      value: method,
      groupValue: _selectedMethod,
      secondary: Image.asset('assets/$assetName', width: 50, height: 50), // Adjust size as needed
      onChanged: (PaymentMethod? value) {
        setState(() {
          _selectedMethod = value!;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Methods'),
      ),
      body: ListView(
        children: [
          _buildPaymentOption(
            title: 'Credit or Debit Card',
            method: PaymentMethod.card,
            assetName: 'card.png', // Make sure this file exists in your assets directory
          ),
          _buildPaymentOption(
            title: 'PayPal',
            method: PaymentMethod.paypal,
            assetName: 'paypal.png', // Make sure this file exists in your assets directory
          ),
          _buildPaymentOption(
            title: 'Apple Pay',
            method: PaymentMethod.applePay,
            assetName: 'apple_pay.png', // Make sure this file exists in your assets directory
          ),
          _buildPaymentOption(
            title: 'Google Pay',
            method: PaymentMethod.googlePay,
            assetName: 'google_pay.png', // Make sure this file exists in your assets directory
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: ElevatedButton(
              onPressed: () {
                // TODO: Save the selected payment method and proceed to the payment screen
                // This is where you would handle saving the selected method and navigating to the payment screen
              },
              child: Text('Save Payment Method'),
            ),
          ),
        ],
      ),
    );
  }
}
