import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile_app_project/product/DUMMY_MODELS.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
 
  // get use information
  var db = FirebaseFirestore.instance;
  var firebaseAuth = FirebaseAuth.instance;
  MyUser currentUser = MyUser();
  List<Product> listProduct = List<Product>.empty(growable: true);

  // create listener
  // Firbase listen
  StreamSubscription<DocumentSnapshot>? _listener;
  bool listenerCreated = false;
  bool isLoading = true;
  setUpListener() {
    final userCollection = db.collection("users");
    userCollection
        .doc(firebaseAuth.currentUser!.uid)
        .snapshots()
        .listen((event) async {
      messengeBoxShow("loading");
      try {
        setState(() {
          isLoading = true;
        });
        await updateCurrentDatabase();
        setState(() {
          isLoading = false;
        });
      } catch (e) {
        messengeBoxShow("Error $e");
      }
    });
  }

  updateCurrentDatabase() async {
    final userCollection = db.collection("users");
    await userCollection.doc(firebaseAuth.currentUser!.uid).get().then(
      (value) {
        currentUser = MyUser.fromFirestore(value);
      },
    );

    final productCollection = db.collection("products");
    await productCollection.get().then((querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        listProduct.add(Product.fromSnapshot(doc));
      });
    });
  }

  @override
  void dispose() {
    _listener?.cancel();
    super.dispose();
  }

  @override
  initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {
      if (firebaseAuth.currentUser == null) {
        // User not login
        Navigator.pushReplacementNamed(context, "logIn");
      } else {
        if (!listenerCreated) {
          _listener = setUpListener();
          listenerCreated = true;
        }
      }
    });

    if (isLoading) {
      return Scaffold(appBar: myAppBar(),  body: widgetLoading());
    } else {
      return Scaffold(appBar: myAppBar(), body: widgetProfileList());
    }
  }

  myAppBar() {
    return AppBar(
      title: const Text("My Orders"),
    );
  }

  // Widget Section
  Widget widgetLoading() {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.3,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
  
   Widget widgetProfileList() {
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

    return ListView.builder(
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
    );
  }

  void messengeBoxShow(String text) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.red, //text Color
        fontSize: 16.0 //font size
    );
  }
}

