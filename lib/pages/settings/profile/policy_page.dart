import 'package:flutter/material.dart';

class PolicyPage extends StatelessWidget {
  final String policyText = """
Privacy Policy

At SoleFusion Hub, we are committed to protecting the privacy and security of our customers and site visitors. Our Privacy Policy outlines how we collect, use, and safeguard your personal information...

Terms of Service

When you use our SoleFusion Hub services, you agree to our Terms of Service. This includes our policies on order processing, shipping, returns, and exchanges...

Refund Policy

SoleFusion Hub provides a transparent refund policy. If you are not satisfied with your purchase, you may return the product within 30 days for a full refund...

End-User License Agreement

By using the SoleFusion Hub app, you agree to our End-User License Agreement which grants you a non-exclusive right to access and use the services...

""";

  void _showAgreementConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Agreement Confirmation'),
          content: const Text('Thank you for your confirmation to our policies.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SoleFusion Hub Policies'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Text(policyText),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () => _showAgreementConfirmation(context),
                child: const Text('Agree to Policy', style: TextStyle(color: Color(0xFF475269), fontWeight:FontWeight.w700),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
