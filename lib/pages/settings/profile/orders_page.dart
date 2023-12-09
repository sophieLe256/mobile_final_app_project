import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This data will eventually come from your backend or database
    final List<Map<String, dynamic>> orders = [
      {
        'id': '001',
        'date': '2023-01-01',
        'total': 99.99,
        'status': 'Shipped'
      },
      {
        'id': '002',
        'date': '2023-01-02',
        'total': 89.99,
        'status': 'Processing'
      },
      {
        'id': '003',
        'date': '2023-01-03',
        'total': 79.99,
        'status': 'Delivered'
      },
      // Add more orders as needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders'),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(Icons.receipt),
              title: Text('Order ID: ${orders[index]['id']}'),
              subtitle: Text('Date: ${orders[index]['date']} - Total: \$${orders[index]['total']} - Status: ${orders[index]['status']}'),
              onTap: () {
                // Handle the tap event, possibly navigating to an order detail page
              },
            ),
          );
        },
      ),
    );
  }
}
