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

                .map((doc) => Product.fromSnapshot(
                    doc as QueryDocumentSnapshot<Map<String, dynamic>>))

                .toList();


            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Display 2 boxes in a row
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                Product product = products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ItemPage(product: product),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          product.img,
                          width: 100,
                          height: 100,
                        ),
                        Text(
                          product.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF475269),
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "New ${product.category} Jordan Shoes",
                          style: TextStyle(
                            fontSize: 13,
                            color: const Color(0xFF475269).withOpacity(0.7),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "\$${product.price}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.redAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );

          } else {

            return Center(
                child: Text('No Jordan shoes found in this category.'));

          }

        },

      ),

    );

  }

}
