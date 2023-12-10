import 'package:flutter/material.dart';
import 'package:mobile_app_project/pages/settings/profile/change_password_page.dart';
import 'package:mobile_app_project/pages/settings/profile/customer_support_page.dart';
import 'profile/settings_page.dart';
import 'profile/orders_page.dart';
import 'payment_methods_page.dart';
import 'profile/customer_support_page.dart';
import 'user_information.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Settings"),
      ),
      body: ListView(
        children: [
          UserInformationSection(),
          OrderHistorySection(),
          PaymentMethodsSection(),
          CustomerSupportSection(),
          AppFeaturesIntegrationSection(),
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
      margin: EdgeInsets.all(8.0), // Add some margin to the card
      child: ListTile(
        title: Text("User Information"),
        trailing: Icon(Icons.person),
        onTap: () {
          // Navigate to the page that shows the list of all orders
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => UserInformationPage()), // Replace with your OrdersPage
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
      child: ListTile(
        title: Text("Change Password"),
        trailing: Icon(Icons.password),
        onTap: () {
          // Navigate to payment methods page
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ChangePasswordPage()), // Replace with your OrdersPage
          );
        },
      ),
    );
  }
}

class OrderHistorySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // You can remove the orders list if you're now only navigating to a general orders page.

    return Card(
      margin: EdgeInsets.all(8.0), // Add some margin to the card
      child: ListTile(
        title: Text('My Orders'),
        trailing: Icon(Icons.gif_box),
        onTap: () {
          // Navigate to the page that shows the list of all orders
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => OrdersPage()), // Replace with your OrdersPage
          );
        },
      ),
    );
  }
}

class PaymentMethodsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text("Payment Methods"),
        trailing: Icon(Icons.add_card),
        onTap: () {
          // Navigate to payment methods page
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => PaymentMethodsPage()), // Replace with your OrdersPage
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
      margin: EdgeInsets.all(8.0),
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
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text("App Settings"),
        trailing: Icon(Icons.settings),
        onTap: () {
          // Navigate to app settings page
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SettingsPage(),
          ));
        },
      ),
    );
  }
}
