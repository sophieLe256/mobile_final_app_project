import 'package:flutter/material.dart';
import 'package:mobile_app_project/firebase_options.dart';
import 'package:mobile_app_project/pages/itemPage.dart';
import 'package:mobile_app_project/services/auth/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'pages/home_page_g.dart';
import 'services/auth/login_or_register.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthService(),
      child: const MyApp(),
    ),
  );
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});


 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blue[100],
      ),
      routes: {
        "logIn": (context) => const LoginOrRegister(),
        "/": (context) => const HomePage(),
        "homePage": (context) => const HomePage(),
        "itemPage": (context) => const ItemPage(),
      },
    );
  }
  
}