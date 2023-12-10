import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile_app_project/pages/catalog/kids_clothing_page.dart';
import 'package:mobile_app_project/pages/catalog/kids_jordan_shoe_page.dart';
import 'package:mobile_app_project/pages/catalog/kids_shoes_page.dart';
import 'package:mobile_app_project/pages/catalog/men_clothing_page.dart';
import 'package:mobile_app_project/pages/catalog/women_clothing_page.dart';
import 'package:mobile_app_project/product/DUMMY_MODELS.dart';
import 'package:mobile_app_project/product/bloc/product_bloc.dart';
import 'package:mobile_app_project/services/auth/auth_service.dart';
import 'package:mobile_app_project/widgets/AllItemWidget.dart';
import 'package:mobile_app_project/widgets/HomeBottomNavBar.dart';
import 'package:mobile_app_project/widgets/RowItemsWidget.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';
import 'package:mobile_app_project/pages/catalog/men_jordan_shoes_page.dart';
import 'package:mobile_app_project/pages/catalog/men_shoes_page.dart';
import 'package:mobile_app_project/pages/catalog/women_jordan_shoes_page.dart';
import 'package:mobile_app_project/pages/catalog/women_shoes_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  //instance of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //sign user out
  void signOut() {
    //get auth service
    final authService = Provider.of<AuthService>(context, listen: false);
    authService.signOut();
    Navigator.popAndPushNamed(context, "logIn");
  }

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
      return Scaffold(body: widgetLoading());
    } else {
      return Scaffold(
          appBar: myAppBar(), drawer: myDrawer(), body: widgetProfileList());
    }
  }

  myAppBar() {
    return AppBar(
      title: const Text('SoleFusion Hub'),
      backgroundColor: Colors.blue[100],
      actions: [
        IconButton(
          onPressed: signOut,
          icon: const Icon(
            Icons.logout,
            size: 30,
            color: Color(0xFF475269),
          ),
        ),
      ],
    );
  }

  myDrawer() {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  // You can replace the AssetImage with your user's profile picture
                  backgroundImage: AssetImage('assets/app_img.jpg'),
                ),
                SizedBox(width: 20),
                Text(
                  currentUser.name ?? "No Name",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
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
          ),
          ExpansionTile(
            title: Text('Men'),
            children: [
              ListTile(
                title: Text('Jordan'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => MenJordanShoesPage()),
                  );
                },
              ),
              ListTile(
                title: Text('Shoes'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MenShoesPage()),
                  );
                },
              ),
              ListTile(
                title: Text('Clothing & Accessories'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MenClothingPage()),
                  );
                },
              ),
              // Add more subcategories for Women as needed
            ],
          ),
          ExpansionTile(
            title: Text('Women'),
            children: [
              ListTile(
                title: Text('Jordan'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => WomenJordanShoesPage()),
                  );
                },
              ),
              ListTile(
                title: Text('Shoes'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => WomenShoesPage()),
                  );
                },
                // Add more subcategories for Men as needed
              ),
              ListTile(
                title: Text('Clothing & Accessories'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => WomenClothingPage()),
                  );
                },
                // Add more subcategories for Men as needed
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Kids'),
            children: [
              ListTile(
                title: Text('Jordan'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => KidsJordanShoesPage()),
                  );
                },
              ),
              ListTile(
                title: Text('Shoes'),
                onTap: () {
                 Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => KidsShoesPage()),
                  );
                },
                // Add more subcategories for Kids as needed
              ),
              ListTile(
                title: Text('Clothing & Accessories'),
                onTap: () {
               Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => KidClothingPage()),
                  );
                },
                // Add more subcategories for Kids as needed
              ),
            ],
          ),
        ],
      ),
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
    bool showNotificationAlert =
        false; // Use this to control the visibility of the alert

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Custom App Bar
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          showNotificationAlert = true;
                        });
                        // Show the alert dialog here directly instead of in the widget tree
                        _showNotificationAlertDialog(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
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
                        child: badges.Badge(
                          badgeStyle: badges.BadgeStyle(
                            badgeColor: Colors.redAccent,
                          ),
                          badgeContent: Text(
                            '1',
                            style: TextStyle(color: Colors.white),
                          ),
                          child: Icon(
                            Icons.notifications,
                            size: 30,
                            color: Color(0xFF475269),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        height: 55,
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
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 5),
                              width: 200,
                              child: TextFormField(
                                  decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search",
                              )),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.search,
                              size: 27,
                              color: Color(0xFF475269),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(1),
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
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
              const RowItemsWidget(),
              const SizedBox(height: 20),

              // Loads and gets products from the firebase firestore.
              AllItemsWidget(products: listProduct),

              // BlocBuilder<ProductBloc, ProductState>(
              //   builder: (context, state) {
              //     if (state is ProductLoading) {
              //       return Center(
              //         child: CircularProgressIndicator(),
              //       );
              //     }
              //     if (state is ProductLoaded) {
              //       return
              //     } else {
              //       return Text('Something went wrong.');
              //     }
              //   },
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const HomeBottomnavBar(),
    );
  }

  void _showNotificationAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:
              Text('Notification', style: TextStyle(color: Color(0xFF475269))),
          content: Text('This is a notification alert!',
              style: TextStyle(color: Color(0xFF475269))),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
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
