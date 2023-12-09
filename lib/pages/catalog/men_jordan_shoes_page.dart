import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_project/pages/itemPage.dart';
import 'package:mobile_app_project/product/DUMMY_MODELS.dart';

class MenJordanShoesPage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Men\'s Jordan Shoes'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        // Query the Firestore database for men's Jordan shoes
        stream: _firestore
            .collection('products')
            .where('category', isEqualTo: 'Men')
            .where('type', isEqualTo: 'Jordan')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
            List<Product> products = snapshot.data!.docs
                .map((doc) => Product.fromSnapshot(doc as QueryDocumentSnapshot<Map<String, dynamic>>))
                .toList();

            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                Product product = products[index];
                return ListTile(
                  leading: Image.asset(product.img, width: 100, height: 100), // Make sure images are available in assets
                  title: Text(product.name),
                  subtitle: Text("\$${product.price}"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ItemPage(product: product),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return Center(child: Text('No Jordan shoes found in this category.'));
          }
        },
      ),
    );
  }
}