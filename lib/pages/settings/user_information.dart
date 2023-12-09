import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile_app_project/product/DUMMY_MODELS.dart';

class UserInformationPage extends StatefulWidget {
  @override
  _UserInformationPageState createState() => _UserInformationPageState();
}

class _UserInformationPageState extends State<UserInformationPage> {

var db = FirebaseFirestore.instance;
  var firebaseAuth = FirebaseAuth.instance;
  MyUser currentUser = MyUser();

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
      messengeBoxShow("updating");
      try {
        setState(() {
          isLoading = true;
        });
        await updateCurrentUser();
        setState(() {
          isLoading = false;
        });
      } catch (e) {
        messengeBoxShow("Error $e");
      }
    });
  }

  updateCurrentUser() async {
    final userCollection = db.collection("users");
    await userCollection.doc(firebaseAuth.currentUser!.uid).get().then(
          (value) {
        currentUser = MyUser.fromFirestore(value);
      },
    );
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
    // loading data
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {
      if (firebaseAuth.currentUser == null) {
        // User not login
        Navigator.pushReplacementNamed(context, "/login");
      } else {
        if (!listenerCreated) {
          _listener = setUpListener();
          listenerCreated = true;
        }
      }
    });
    // render UI here
    if (isLoading) {
      return Scaffold(body: widgetLoading());
    } else {
      return Scaffold(appBar: myAppBar(), body: widgetProfileList());
    }
  }

  // add-on
  myAppBar() {
    return AppBar(
      title: const Text("User Information'"),
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

    TextEditingController _emailController =    TextEditingController(text: currentUser.email);
    TextEditingController _nameController =    TextEditingController(text: currentUser.name ?? "No Name");
     TextEditingController _phoneController =    TextEditingController(text: currentUser.phone ?? "No phone");
      TextEditingController _addressController =    TextEditingController(text: currentUser.address ?? "No Address");
    TextEditingController currentPasswordController = TextEditingController();
    TextEditingController newPasswordController = TextEditingController();

    saveChange() async {     

      // Update password
      if (newPasswordController.text != "" &&
          currentPasswordController.text != "") {
        try {
          AuthCredential credential = EmailAuthProvider.credential(
              email: currentUser.email!,
              password: currentPasswordController.text);
          await firebaseAuth.currentUser!
              .reauthenticateWithCredential(credential);
          await firebaseAuth.currentUser!
              .updatePassword(newPasswordController.text);
        } catch (e) {
          messengeBoxShow("Can not update password. Error:$e");
          return;
        }
      }
      // let update name
      currentUser.name = _nameController.text;
       currentUser.phone =  _phoneController.text;
      currentUser.address= _addressController.text; 
      // Push data
      try {
        final userCollection = db.collection("users");
        await userCollection
            .doc(currentUser.userID)
            .set(currentUser.toFirestore());
        messengeBoxShow("Updated succesful");
      } catch (e) {
        messengeBoxShow("Can not update information. Error:$e");
      }
    }

    saveChangeButton() {
      saveChange().then((value) {});
    }
  
    // Dummy user data - replace with actual data retrieval mechanism
 
    return Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Phone',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 10),
            TextField(
              controller: _emailController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Email Address',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 10),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 20),
            const Text(
            'Change Password:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextFormField(
            controller: currentPasswordController,
            obscureText: true,
            decoration: const InputDecoration(labelText: 'Current Password'),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: newPasswordController,
            decoration: const InputDecoration(labelText: 'New Password'),
          ),
          const SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveChangeButton,
            child: const Text('Save Changes'),
            ),
          ],
        ),
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
