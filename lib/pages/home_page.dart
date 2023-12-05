import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app_project/product/bloc/product_bloc.dart';
import 'package:mobile_app_project/services/auth/auth_service.dart';
import 'package:mobile_app_project/widgets/AllItemWidget.dart';
import 'package:mobile_app_project/widgets/HomeBottomNavBar.dart';
import 'package:mobile_app_project/widgets/RowItemsWidget.dart';
import 'package:provider/provider.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      drawer: Drawer(
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
                    'Shop',
                    style: TextStyle(fontSize: 20, color: Colors.black),
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
                    // Navigate to Women's Casual Shoes
                    // Replace with your navigation logic
                    Navigator.pop(context); // Close the drawer
                    // Navigate to Women's Casual Shoes screen
                    Navigator.pushNamed(context, '/women_jordan_shoes');
                  },
                ),
                ListTile(
                  title: Text('Shoes'),
                  onTap: () {
                    // Navigate to Women's Formal Shoes
                    // Replace with your navigation logic
                    Navigator.pop(context); // Close the drawer
                    // Navigate to Women's Formal Shoes screen
                    Navigator.pushNamed(context, '/women_shoes');
                  },
                ),
                ListTile(
                  title: Text('Clothing & Accessories'),
                  onTap: () {
                    // Navigate to Women's Formal Shoes
                    // Replace with your navigation logic
                    Navigator.pop(context); // Close the drawer
                    // Navigate to Women's Formal Shoes screen
                    Navigator.pushNamed(context, '/women_clothing');
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
                    // Navigate to Men's Casual Shoes
                    // Replace with your navigation logic
                    Navigator.pop(context); // Close the drawer
                    // Navigate to Men's Casual Shoes screen
                    Navigator.pushNamed(context, '/men_jordan_shoes');
                  },
                ),
                ListTile(
                  title: Text('Shoes'),
                  onTap: () {
                    // Navigate to Men's Formal Shoes
                    // Replace with your navigation logic
                    Navigator.pop(context); // Close the drawer
                    // Navigate to Men's Formal Shoes screen
                    Navigator.pushNamed(context, '/men_shoes');
                  },
                  // Add more subcategories for Men as needed
                ),
                ListTile(
                  title: Text('Clothing & Accessories'),
                  onTap: () {
                    // Navigate to Men's Formal Shoes
                    // Replace with your navigation logic
                    Navigator.pop(context); // Close the drawer
                    // Navigate to Men's Formal Shoes screen
                    Navigator.pushNamed(context, '/men_clothing');
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
                    // Navigate to Kids' Boys Shoes
                    // Replace with your navigation logic
                    Navigator.pop(context); // Close the drawer
                    // Navigate to Kids' Boys Shoes screen
                    Navigator.pushNamed(context, '/kids_jordan_shoes');
                  },
                ),
                ListTile(
                  title: Text('Shoes'),
                  onTap: () {
                    // Navigate to Kids' Girls Shoes
                    // Replace with your navigation logic
                    Navigator.pop(context); // Close the drawer
                    // Navigate to Kids' Girls Shoes screen
                    Navigator.pushNamed(context, '/kids_shoes');
                  },
                  // Add more subcategories for Kids as needed
                ),
                ListTile(
                  title: Text('Clothing & Accessories'),
                  onTap: () {
                    // Navigate to Kids' Girls Shoes
                    // Replace with your navigation logic
                    Navigator.pop(context); // Close the drawer
                    // Navigate to Kids' Girls Shoes screen
                    Navigator.pushNamed(context, '/kids_clothing');
                  },
                  // Add more subcategories for Kids as needed
                ),
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Custom App Bar
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
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
                      child: const badges.Badge(
                        badgeStyle: badges.BadgeStyle(
                          badgeColor: Colors.redAccent,
                        ),
                        badgeContent: Text(
                          '3',
                          style: TextStyle(color: Colors.white),
                        ),
                        child: Icon(
                          Icons.notifications,
                          size: 30,
                          color: Color(0xFF475269),
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
              //Loads and gets products from the firebase firestore.
              BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state is ProductLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is ProductLoaded) {
                    return AllItemsWidget(products: state.products);
                  } else {
                    return Text('Something went wrong.');
                  }
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const HomeBottomnavBar(),
    );
  }
}
