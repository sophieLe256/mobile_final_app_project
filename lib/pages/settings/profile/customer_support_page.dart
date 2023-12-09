import 'package:flutter/material.dart';
import 'frequently_asked_questions_page.dart';

class CustomerSupportPage extends StatelessWidget {
  // Dummy support contact information
  final String supportEmail = "SolFusionHub@gmail.com";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Support'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.email),
            title: Text('Email Us'),
            subtitle: Text(supportEmail),
            onTap: () {

            }
          ),
          // ... other ListTiles
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Call Us'),
            subtitle: Text('+1 470-583-0674'),
            onTap: () {
              // Navigate to live chat page or initiate chat
            },
          ),
          ListTile(
            leading: Icon(Icons.help_outline),
            title: Text('FAQs'),
            onTap: () {
              // Navigate to FAQs page
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => FAQsPage(),
              ));
            },
          ),
          // Add other customer support options as needed
        ],
      ),
    );
  }
}
