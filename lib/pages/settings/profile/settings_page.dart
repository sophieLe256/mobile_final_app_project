import 'package:flutter/material.dart';
import 'package:mobile_app_project/pages/settings/profile/change_password_page.dart';
import 'package:mobile_app_project/pages/settings/profile/customer_support_page.dart';
import 'package:mobile_app_project/pages/settings/profile_page.dart';
import 'app_information_page.dart';
import 'policy_page.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: ListView(
        children: [
          UserInformationSection(),
          CustomerSupportSection(),
          AppFeaturesIntegrationSection(),
          AccountManagementSection(),
          PolicySection(),
        ],
      ),
    );
  }
}

class UserInformationSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // You can remove the orders list if you're now only navigating to a general orders page.

    return Card(
      margin: EdgeInsets.all(12.0), // Add some margin to the card
      child: ListTile(
        title: Text('Account Settings'),
        trailing: Icon(Icons.person),
        onTap: () {
          // Navigate to the page that shows the list of all orders
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ProfilePage()), // Replace with your OrdersPage
          );
        },
      ),
    );
  }
}

class AccountManagementSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(12.0),
      child: ListTile(
        title: Text("Change Password"),
        trailing: Icon(Icons.password),
        onTap: () {
          // Navigate to payment methods page
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ChangePasswordPage()),
          );
        },
      ),
    );
  }
}

class CustomerSupportSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(12.0),
      child: ListTile(
        title: Text("Customer Support"),
        trailing: Icon(Icons.contact_support_outlined),
        onTap: () {
          // Navigate to customer support page
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => CustomerSupportPage()), // Replace with your OrdersPage
          );
        },
      ),
    );
  }
}

class AppFeaturesIntegrationSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(12.0),
      child: ListTile(
        title: Text("App Information"),
        trailing: Icon(Icons.settings_cell),
        onTap: () {
          // Navigate to app settings page
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AppInformationPage(),
          ));
        },
      ),
    );
  }
}

class PolicySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(12.0),
      child: ListTile(
        title: Text("Our Policy"),
        trailing: Icon(Icons.policy),
        onTap: () {
          // Navigate to customer support page
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => PolicyPage()), // Replace with your OrdersPage
          );
        },
      ),
    );
  }
}
