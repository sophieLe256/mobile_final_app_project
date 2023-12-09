import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobile_app_project/product/DUMMY_MODELS.dart';
import 'package:provider/provider.dart';
import 'package:mobile_app_project/product/bloc/product_bloc.dart';
import 'dart:math';

class CheckoutScreen extends StatefulWidget {
  final List<Product> cartList;
  final double total;

  CheckoutScreen({required this.cartList, required this.total});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class ConfirmationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Confirmation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline,
              size: 100,
              color: Colors.green,
            ),
            SizedBox(height: 20),
            Text(
              'Thank you for your purchase!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text('Confirmation order details here...'),
            // Add order details if needed
          ],
        ),
      ),
    );
  }
}

class _CheckoutScreenState extends State<CheckoutScreen> {
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

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController addressLine1Controller = TextEditingController();
  final TextEditingController addressLine2Controller = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();
  final TextEditingController cardNameController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expirationDateController =
      TextEditingController();
  final TextEditingController cvcController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ProductState state = context.read<ProductBloc>().state;
    List<Product> cartList = List<Product>.empty(growable: true);
    if (state is ProductLoaded) {
      cartList = state.products
          .where((product) =>
              product.cart.contains(FirebaseAuth.instance.currentUser!.uid))
          .toList();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Shipping Address
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF475269).withOpacity(0.3),
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shipping Address',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF475269),
                    ),
                  ),
                  SizedBox(height: 10),
                  // Shipping Address Input Fields
                  buildTextField('Full Name', fullNameController),
                  SizedBox(height: 10),
                  buildTextField('Address Line 1', addressLine1Controller),
                  SizedBox(height: 10),
                  buildTextField('Address Line 2', addressLine2Controller),
                  SizedBox(height: 10),
                  buildTextField('City', cityController),
                  SizedBox(height: 10),
                  buildTextField('State', stateController),
                  SizedBox(height: 10),
                  buildTextField('Zip Code', zipCodeController),
                ],
              ),
            ),

            SizedBox(height: 20),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF475269).withOpacity(0.3),
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Payment Information',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  // Payment Information Input Fields
                  buildTextField('Name on Card', cardNameController),
                  SizedBox(height: 10),
                  buildTextField('Card Number', cardNumberController),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: buildTextField(
                            'Expiration Date', expirationDateController),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        flex: 1,
                        child: buildTextField('CVC', cvcController),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Display the total amount here
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
                ],
              ),
            ),

            SizedBox(height: 30),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  completePurchase(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Complete Purchase',
                    style: TextStyle(fontSize: 18, color: Color(0xFF475269)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $labelText';
          }
          return null;
        },
      ),
    );
  }

  void completePurchase(BuildContext context) async {
    if (_validateForm()) {
      final User? user = FirebaseAuth.instance.currentUser;
      final _firestore = FirebaseFirestore.instance;

      // Access the state using Provider
      final ProductState state = context.read<ProductBloc>().state;

      if (state is ProductLoaded) {
        // Get the cartList from the state or wherever it's stored
        // List<Product> cartList = state.products
        //     .where((product) =>
        //         product.cart.contains(FirebaseAuth.instance.currentUser!.uid))
        //     .toList();
        final DateTime now = DateTime.now();
        final Timestamp timestamp = Timestamp.fromDate(now);

        List<Product> cartList = state.products
            .where((product) =>
                product.cart.contains(FirebaseAuth.instance.currentUser!.uid))
            .toList();
        var productL = cartList.map((e) => e.id).toList();

        // Save order details to Firestore
        await _firestore.collection('users').doc(user!.uid).update({
          'userOrder': FieldValue.arrayUnion([
            {
              'products': productL,
              'total': calculateTotal(cartList),
              'address': {
                'fullName': fullNameController.text,
                'addressLine1': addressLine1Controller.text,
                'addressLine2': addressLine2Controller.text,
                'city': cityController.text,
                'state': stateController.text,
                'zipCode': zipCodeController.text,
                'status': 'Processing',
                'date': timestamp,
              },
            }
          ]),
        });

        // Remove each product from the cart
        for (Product product in cartList) {
          await removeCart(product: product);
        }

        // Add logic for payment process if needed

        // Navigate back or to the next screen
        // Navigate to the confirmation screen after purchase is completed
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ConfirmationScreen()),
        );
      }
    }
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
          duration: Duration(seconds: 2),
          content: Text("Purchase Compplete!")));
    } else {}
  }

  bool _validateForm() {
    // Validate the form fields
    if (fullNameController.text.isEmpty ||
        addressLine1Controller.text.isEmpty ||
        cityController.text.isEmpty ||
        stateController.text.isEmpty ||
        zipCodeController.text.isEmpty ||
        cardNameController.text.isEmpty ||
        cardNumberController.text.isEmpty ||
        expirationDateController.text.isEmpty ||
        cvcController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill in all the required fields.'),
        ),
      );
      return false;
    }

    // Add additional validation logic if needed

    return true;
  }
}
