// import 'dart:math';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mobile_app_project/pages/itemPage.dart';
// import 'package:mobile_app_project/product/DUMMY_MODELS.dart';
// import 'package:mobile_app_project/product/bloc/product_bloc.dart';

// import '../pages/checkout_page.dart';

// // Bottom Cart Sheet

// class BottomCartSheet extends StatefulWidget {
//   @override
//   _BottomCartSheetState createState() => _BottomCartSheetState();
// }

// class _BottomCartSheetState extends State<BottomCartSheet> {
//   @override
//   Widget build(BuildContext context) {
//     ///get data
//   void checkoutFunction() {
//   // Navigate to the checkout screenq
//   Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) => CheckoutScreen()),
//   );
// }

//     List<Product> cartList = [];

//     double getSum(List<Product> l) {
//       double subtotal = 0;
//       for (int i = 0; i < l.length; i++) {
//         subtotal += l[i].price;
//       }
//       return subtotal;
//     }

//     double roundNum(double value, int places) {
//       num mod = pow(10.0, places);
//       return ((value * mod).round().toDouble() / mod);
//     }

//     Future<void> removeCart({required Product product}) async {
//       final User? user = FirebaseAuth.instance.currentUser;
//       if (product.cart.contains(user!.uid)) {
//         await FirebaseFirestore.instance
//             .collection('products')
//             .doc(product.id)
//             .update({
//           "cart": FieldValue.arrayRemove([user?.uid])
//         });
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//             duration: Duration(seconds: 1),
//             content: Text("Product removed from cart")));
//       } else {}
//     }
//   /// fucntion here
//     return BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
//       // right here
//       double discount = 100.00;
//       if (state is ProductLoading) {
//         return Center(
//           child: CircularProgressIndicator(),
//         );
//       }
//       if (state is ProductLoaded) {
//         List<Product> cartList = state.products
//             .where((products) =>
//                 products.cart.contains(FirebaseAuth.instance.currentUser!.uid))              
//             .toList();
//             List<Product> sortedList = state.products
//             .where((products) =>
//                 products.name.contains("key"))              
//             .toList();
//             // render UI
//         return Material(
//           child: Container(
//             height: 600,
//             padding: const EdgeInsets.all(20),
//             color: Colors.blue[100],
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   SizedBox(
//                     height: 500,
//                     child: SingleChildScrollView(
//                       child: Column(
//                         children: [
//                           for (int i = 0; i < cartList.length; i++)
//                             Container(
//                               margin: const EdgeInsets.symmetric(
//                                   vertical: 10, horizontal: 15),
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 10),
//                               height: 140,
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(10),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: const Color(0xFF475269)
//                                         .withOpacity(0.3),
//                                     blurRadius: 5,
//                                     spreadRadius: 1,
//                                   ),
//                                 ],
//                               ),
//                               child: Row(
//                                 children: [
//                                   InkWell(
//                                     onTap: () {
//                                       Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) => ItemPage(
//                                                   product: cartList[i])));
//                                     },
//                                     child: Stack(
//                                       alignment: Alignment.center,
//                                       children: [
//                                         Container(
//                                           margin: const EdgeInsets.only(
//                                               top: 0, right: 10),
//                                           height: 90,
//                                           width: 110,
//                                           decoration: BoxDecoration(
//                                             color: const Color(0xFF475269),
//                                             borderRadius:
//                                                 BorderRadius.circular(5),
//                                           ),
//                                         ),
//                                         Positioned(
//                                           left: 5,
//                                           child: Image.asset(
//                                             cartList[i].img,
//                                             height: 100,
//                                             width: 100,
//                                             fit: BoxFit.contain,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         vertical: 30),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Text(
//                                           cartList[i].name,
//                                           style: TextStyle(
//                                             color: Color(0xFF475269),
//                                             fontSize: 20,
//                                             fontWeight: FontWeight.w600,
//                                           ),
//                                         ),
//                                         Row(
//                                           children: [
//                                             Container(
//                                               padding: const EdgeInsets.all(5),
//                                               decoration: BoxDecoration(
//                                                 color: Colors.white,
//                                                 borderRadius:
//                                                     BorderRadius.circular(10),
//                                                 boxShadow: [
//                                                   BoxShadow(
//                                                     color:
//                                                         const Color(0xFF475269)
//                                                             .withOpacity(0.3),
//                                                     blurRadius: 5,
//                                                     spreadRadius: 1,
//                                                   ),
//                                                 ],
//                                               ),
//                                               child: const Icon(
//                                                   CupertinoIcons.minus,
//                                                   size: 18),
//                                             ),
//                                             Container(
//                                               margin:
//                                                   const EdgeInsets.symmetric(
//                                                       horizontal: 10),
//                                               child: Text(
//                                                   "${cartList[i].quantity}",
//                                                   style: TextStyle(
//                                                     color: Color(0xFF475269),
//                                                     fontSize: 18,
//                                                     fontWeight: FontWeight.w500,
//                                                   )),
//                                             ),
//                                             Container(
//                                               padding: const EdgeInsets.all(5),
//                                               decoration: BoxDecoration(
//                                                 color: Colors.white,
//                                                 borderRadius:
//                                                     BorderRadius.circular(10),
//                                                 boxShadow: [
//                                                   BoxShadow(
//                                                     color:
//                                                         const Color(0xFF475269)
//                                                             .withOpacity(0.3),
//                                                     blurRadius: 5,
//                                                     spreadRadius: 1,
//                                                   ),
//                                                 ],
//                                               ),
//                                               child: const Icon(
//                                                   CupertinoIcons.plus,
//                                                   size: 18),
//                                             ),
//                                           ],
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                   const Spacer(),
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         vertical: 25),
//                                     child: Column(
//                                       children: [
//                                         Container(
//                                           padding: const EdgeInsets.all(0),
//                                           decoration: BoxDecoration(
//                                             color: Colors.white,
//                                             borderRadius:
//                                                 BorderRadius.circular(10),
//                                             boxShadow: [
//                                               BoxShadow(
//                                                   color: Colors.purple
//                                                       .withOpacity(0.4),
//                                                   blurRadius: 5,
//                                                   spreadRadius: 1),
//                                             ],
//                                           ),
//                                           child: IconButton(
//                                             onPressed: () {
//                                               removeCart(product: cartList[i]);
//                                             },
//                                             icon: Icon(Icons.delete),
//                                             color: Colors.red,
//                                             iconSize: 20,
//                                           ),
//                                         ),
//                                         const Spacer(),
//                                         Text(
//                                           "${cartList[i].price}",
//                                           style: TextStyle(
//                                             color: Color(0xFF475269),
//                                             fontWeight: FontWeight.w500,
//                                             fontSize: 20,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           Container(
//                             margin: const EdgeInsets.symmetric(
//                                 vertical: 10, horizontal: 15),
//                             padding: const EdgeInsets.all(15),
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(10),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color:
//                                       const Color(0xFF475269).withOpacity(0.3),
//                                   spreadRadius: 1,
//                                   blurRadius: 5,
//                                 )
//                               ],
//                             ),
//                             child: Column(
//                               children: [
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       "Delivery Fee:",
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.bold,
//                                         color: Color(0xFF475269),
//                                       ),
//                                     ),
//                                     Text(
//                                       "\$${cartList.isEmpty ? '0.00' : roundNum(getSum(cartList) * 0.1, 2)}",
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.bold,
//                                         color: Color(0xFF475269),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 Divider(
//                                   height: 20,
//                                   thickness: 0.5,
//                                   color: Color(0xFF475269),
//                                 ),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       "Sub-Total:",
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.bold,
//                                         color: Color(0xFF475269),
//                                       ),
//                                     ),
//                                     Text(
//                                       "\$${cartList.isEmpty ? '0.00' : roundNum(getSum(cartList), 2)}",
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.bold,
//                                         color: Color(0xFF475269),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 Divider(
//                                   height: 20,
//                                   thickness: 0.5,
//                                   color: Color(0xFF475269),
//                                 ),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       "Discount:",
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.bold,
//                                         color: Color(0xFF475269),
//                                       ),
//                                     ),
//                                     Text(
//                                       "-\$${cartList.isEmpty ? '0.00' : roundNum(getSum(cartList) * 0.1, 2)}",
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.redAccent,
//                                       ),
//                                     ),
//                                   ],
//                                 )
//                               ],
//                             ),
//                           ),
//                           //check out
//                           Container(
//                             padding: const EdgeInsets.symmetric(horizontal: 20),
//                             height: 80,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: const BorderRadius.only(
//                                   topLeft: Radius.circular(25),
//                                   topRight: Radius.circular(25)),
//                               boxShadow: [
//                                 BoxShadow(
//                                     color: const Color(0xFF475269)
//                                         .withOpacity(0.3),
//                                     blurRadius: 5),
//                               ],
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text(
//                                       "Total",
//                                       style: TextStyle(
//                                         fontSize: 22,
//                                         color: Color(0xFF475269),
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 8,
//                                     ),
//                                     Text(
//                                       "\$${roundNum(getSum(cartList), 2)}",
//                                       style: TextStyle(
//                                         fontSize: 20,
//                                         color: Colors.redAccent,
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 InkWell(
//                                   onTap: checkoutFunction,
//                                   child: Container(
//                                       padding: const EdgeInsets.symmetric(
//                                           vertical: 15, horizontal: 20),
//                                       decoration: BoxDecoration(
//                                         color: const Color(0xFF475269),
//                                         borderRadius: BorderRadius.circular(10),
//                                       ),
//                                       child: const Text("Check Out",
//                                           style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 18,
//                                               fontWeight: FontWeight.bold))),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       } else {
//         return Text("Something went wrong!");
//       }
//     });
//   }
// }
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app_project/pages/itemPage.dart';
import 'package:mobile_app_project/product/DUMMY_MODELS.dart';
import 'package:mobile_app_project/product/bloc/product_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../pages/checkout_page.dart';

// Bottom Cart Sheet

class BottomCartSheet extends StatefulWidget {
  @override
  _BottomCartSheetState createState() => _BottomCartSheetState();
}

class _BottomCartSheetState extends State<BottomCartSheet> {
  List<Product> cartList = [];

  double getSum(List<Product> l) {
    double subtotal = 0;
    for (int i = 0; i < l.length; i++) {
      subtotal += l[i].price;
    }
    return subtotal;
  }

  double roundNum(double value, int places) {
    num mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }

  double calculateTotal(List<Product> cartList) {
    double subtotal = getSum(cartList);
    double deliveryFee = roundNum(subtotal * 0.1, 2);
    double discount = roundNum(subtotal * 0.1, 2);

    return roundNum(subtotal + deliveryFee - discount, 2);
  }
  

  @override
  Widget build(BuildContext context) {
    ///get data
  Future<void> checkoutFunction() async {
    // Ensure that the cartList contains the correct data
    //print("CartList before navigating to CheckoutScreen: $cartList");

    // Navigate to the checkout screen and pass the cartList and total as parameters
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CheckoutScreen(
          cartList: cartList,
          total: calculateTotal(cartList),
        ),
      ),
    );
  }

    //List<Product> cartList = [];

    Future<void> saveCartToFirestore(List<Product> cartList) async {
      final User? user = FirebaseAuth.instance.currentUser;

      await FirebaseFirestore.instance.collection('users').doc(user!.uid).set({
        'uid': user.uid,
        'email': user.email,
        'userOrder': cartList.map((product) => product.toMap()).toList(),
      });
    }

    Future<void> removeCart({required Product product}) async {
      final User? user = FirebaseAuth.instance.currentUser;
      if (product.cart.contains(user!.uid)) {
        await FirebaseFirestore.instance
            .collection('products')
            .doc(product.id)
            .update({
          "cart": FieldValue.arrayRemove([user?.uid])
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: Duration(seconds: 1),
            content: Text("Product removed from cart")));
      } else {}
    }

    return BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
      if (state is ProductLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is ProductLoaded) {
        List<Product> cartList = state.products
            .where((products) =>
                products.cart.contains(FirebaseAuth.instance.currentUser!.uid))
            .toList();
        return Material(
          child: Container(
            height: 600,
            padding: const EdgeInsets.all(20),
            color: Colors.blue[100],
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 500,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          for (int i = 0; i < cartList.length; i++)
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: 140,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFF475269)
                                        .withOpacity(0.3),
                                    blurRadius: 5,
                                    spreadRadius: 1,
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ItemPage(
                                                  product: cartList[i])));
                                    },
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                              top: 0, right: 10),
                                          height: 90,
                                          width: 110,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF475269),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                        ),
                                        Positioned(
                                          left: 5,
                                          child: Image.asset(
                                            cartList[i].img,
                                            height: 100,
                                            width: 100,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 30),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          cartList[i].name,
                                          style: TextStyle(
                                            color: Color(0xFF475269),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color:
                                                        const Color(0xFF475269)
                                                            .withOpacity(0.3),
                                                    blurRadius: 5,
                                                    spreadRadius: 1,
                                                  ),
                                                ],
                                              ),
                                              child: const Icon(
                                                  CupertinoIcons.minus,
                                                  size: 18),
                                            ),
                                            Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Text(
                                                  // "${cartList[i].quantity}",
                                                  "1",
                                                  style: TextStyle(
                                                    color: Color(0xFF475269),
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                  )),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color:
                                                        const Color(0xFF475269)
                                                            .withOpacity(0.3),
                                                    blurRadius: 5,
                                                    spreadRadius: 1,
                                                  ),
                                                ],
                                              ),
                                              child: const Icon(
                                                  CupertinoIcons.plus,
                                                  size: 18),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 25),
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(0),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.purple
                                                      .withOpacity(0.4),
                                                  blurRadius: 5,
                                                  spreadRadius: 1),
                                            ],
                                          ),
                                          child: IconButton(
                                            onPressed: () {
                                              removeCart(product: cartList[i]);
                                            },
                                            icon: Icon(Icons.delete),
                                            color: Colors.red,
                                            iconSize: 20,
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          "${cartList[i].price}",
                                          style: TextStyle(
                                            color: Color(0xFF475269),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color(0xFF475269).withOpacity(0.3),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                )
                              ],
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Delivery Fee:",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF475269),
                                      ),
                                    ),
                                    Text(
                                      "\$${cartList.isEmpty ? '0.00' : roundNum(getSum(cartList) * 0.1, 2)}",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF475269),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  height: 20,
                                  thickness: 0.5,
                                  color: Color(0xFF475269),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Sub-Total:",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF475269),
                                      ),
                                    ),
                                    Text(
                                      "\$${cartList.isEmpty ? '0.00' : roundNum(getSum(cartList), 2)}",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF475269),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  height: 20,
                                  thickness: 0.5,
                                  color: Color(0xFF475269),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Discount:",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF475269),
                                      ),
                                    ),
                                    Text(
                                      "-\$${cartList.isEmpty ? '0.00' : roundNum(getSum(cartList) * 0.1, 2)}",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.redAccent,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          //check out
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25)),
                              boxShadow: [
                                BoxShadow(
                                    color: const Color(0xFF475269)
                                        .withOpacity(0.3),
                                    blurRadius: 5),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Total",
                                      style: TextStyle(
                                        fontSize: 22,
                                        color: Color(0xFF475269),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      '\$${calculateTotal(cartList)}',
                                      style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.redAccent,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: checkoutFunction,
                                  child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 20),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF475269),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Text("Check Out",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold))),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      } else {
        return Text("Something went wrong!");
      }
    });
  }
}