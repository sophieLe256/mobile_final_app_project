import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
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
        title: const Text('AppName'),
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
              child: Text(
                'Menu',
                style: TextStyle(fontSize: 24, color: Colors.white),
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
            ListTile(
              title: Text('Women'),
              onTap: () {
                // Navigate to Women's shoe types
                // Replace with your navigation logic
                Navigator.pop(context); // Close the drawer
                // Navigate to Women's shoe types screen
                Navigator.pushNamed(context, '/women_shoes');
              },
            ),
            ListTile(
              title: Text('Men'),
              onTap: () {
                // Navigate to Men's shoe types
                // Replace with your navigation logic
                Navigator.pop(context); // Close the drawer
                // Navigate to Men's shoe types screen
                Navigator.pushNamed(context, '/men_shoes');
              },
            ),
            ListTile(
              title: Text('Kids'),
              onTap: () {
                // Navigate to Kids' shoe types
                // Replace with your navigation logic
                Navigator.pop(context); // Close the drawer
                // Navigate to Kids' shoe types screen
                Navigator.pushNamed(context, '/kids_shoes');
              },
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
              const AllItemsWidget(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const HomeBottomnavBar(),
    );
  }
}
