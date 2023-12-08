import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Account Settings'),
            onTap: () {
              // TODO: Navigate to the Profile Page

            },
          ),
          ListTile(
            leading: Icon(Icons.feedback),
            title: Text('Customer Feedback'),
            onTap: () {
              // TODO: Navigate to feedback page or dialog
            },
          ),


          // Add other settings options here as needed...
        ],
      ),
    );
  }
}
