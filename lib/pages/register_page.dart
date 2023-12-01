import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth/auth_service.dart';
import '../components/my_button.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  var racinglock = false;
  //sign up user
  void signUp() async {
    if (racinglock) return;
    racinglock = true;
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password does not match! "),
        ),
      );
    }

    //get auth servive
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await authService.signUpWithEmailAndPassword(
        emailController.text,
        passwordController.text,
      );

      // Sign up done
      // check if firebase logged
      // if yes move to home
      // if no move to log in page
      if (FirebaseAuth.instance.currentUser != null) {
        // signed in
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Register sucessfull. Welcome to our app!!!"),
          ),
        );
        Navigator.popAndPushNamed(context, "/");
      } else {
        // signed out
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Register sucessfull. Moving to Log In Page..."),
          ),
        );
        Navigator.popAndPushNamed(context, "login");
      }
    } catch (e) {
      // error catch here
      print("Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    } finally {
      // open racing lock...
      // no 2 duplicate pressing button can be
      racinglock = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo
              const Icon(
                Icons.shopping_bag_rounded,
                size: 100,
                color: Colors.white,
              ),

              const SizedBox(height: 50),

              //create an account message
              const Text(
                "Let's create an account for you!",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 25),

              //email textfield
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  fillColor:
                      Colors.white, // Change this color to the desired color
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
                obscureText: false,
              ),

              const SizedBox(height: 10),

              //password textfield
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  hintText: 'Password',
                  fillColor:
                      Colors.white, // Change this color to the desired color
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
                obscureText: true,
              ),

              const SizedBox(height: 10),

              //confirm password textfield
              TextField(
                controller: confirmPasswordController,
                decoration: const InputDecoration(
                  hintText: 'Confirm Password',
                  fillColor:
                      Colors.white, // Change this color to the desired color
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
                obscureText: true,
              ),

              const SizedBox(height: 25),

              //sign up button
              MyButton(onTap: signUp, text: "Sign Up"),

              const SizedBox(height: 50),

              //not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already a member?'),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Login now.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
