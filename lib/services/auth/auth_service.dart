import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService extends ChangeNotifier {
  //instance of auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //instance of firestorșs
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //user sign in method
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      //sign ins
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      //add a new document for the usre in users collection if it doesn't already exits
      _firestore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
      }, SetOptions(merge: true));

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //create a new user
//   Future<UserCredential> signUpWithEmailAndPassword(
//       String email, String password) async {
//     try {
//       UserCredential userCredential =
//           await _firebaseAuth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );

//       //after creating the user, create a new document for the user in the users collection
//       _firestore.collection('users').doc(userCredential.user!.uid).set({
//         'uid': userCredential.user!.uid,
//         'email': email,
//       });

//       return userCredential;
//     } on FirebaseAuthException catch (e) {
//       throw Exception(e.code);
//     }
//   }

//   //user sign out method
//   Future<void> signOut() async {
//     return await FirebaseAuth.instance.signOut();
//   }
// }

  Future<UserCredential> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Rest of your code...
      _firestore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
      });

      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        // Handle the case where the email is already registered
        // You can notify the user, navigate to a login page, etc.
        // For example:
        throw Exception('Register successfuly. Please log in instead.');
      } else {
        // Handle other FirebaseAuthException errors
        throw Exception(e.code);
      }
    }
  }
  Future<void> signOut() async {
    return await FirebaseAuth.instance.signOut();
  }

  resetPassword(String text) {}
}
