import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_project/product/DUMMY_PRODUCTS.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

import 'BottomCartSheet.dart';

class ItemBottomNavBar extends StatelessWidget {
  const ItemBottomNavBar({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    Future<void> addCart({required Product product}) async {
      final User? user = FirebaseAuth.instance.currentUser;
      if (product.favorite.contains(user!.uid)) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: Duration(seconds: 1),
            content: Text("Product is already in cart!")));
      } else {
        product.favorite.add(user.uid);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: Duration(seconds: 1),
            content: Text("Product is added to cart.")));
      }
      await FirebaseFirestore.instance
          .collection('products')
          .doc(product.id)
          .update({
        "cart": FieldValue.arrayUnion([user.uid])
      });
    }

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //Button for Add to cart
          GestureDetector(
            onTap: () {
              addCart(product: product);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              decoration: BoxDecoration(
                color: const Color(0xFF475269),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF475269).withOpacity(0.3),
                    blurRadius: 5,
                    spreadRadius: 1,
                  )
                ],
              ),
              child: Row(
                children: [
                  Text("Add To Cart",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      )),
                  SizedBox(height: 10),
                  SizedBox(width: 10),
                  Icon(CupertinoIcons.cart_badge_plus,
                      color: Colors.white, size: 30)
                ],
              ),
            ),
          ), // End of Add to cart button

          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            decoration: BoxDecoration(
              color: const Color(0xFF475269),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF475269).withOpacity(0.3),
                  blurRadius: 5,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: InkWell(
              onTap: () {
                showSlidingBottomSheet(
                  context,
                  builder: (context) {
                    return SlidingSheetDialog(
                        elevation: 8,
                        cornerRadius: 16,
                        builder: (context, state) {
                          return BottomCartSheet();
                        });
                  },
                );
              },
              child:
                  const Icon(Icons.shopping_bag, color: Colors.white, size: 45),
            ),
          ),
        ],
      ),
    );
  }
}
