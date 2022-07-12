import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'login_screen.dart';

class PasswordScreen extends StatefulWidget {
  PasswordScreen({Key? key}) : super(key: key);

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  // form key
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController emailController = TextEditingController();

  // firebase
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    // email field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please enter your email");
        }

        // reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.email),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    // send email button
    final sendRequestButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.orangeAccent,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          checkAttempt(emailController.text);
        },
        child: Text(
          "Send Request",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Reset Password",
            style: TextStyle(color: Colors.orangeAccent)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            // pass to the root
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.orangeAccent,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 200,
                      child: Image.asset(
                        "assets/logo.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 45),
                    emailField,
                    SizedBox(height: 25),
                    sendRequestButton,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // check account valid
  Future checkAttempt(String email) async {
    try {
      return FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .get()
          .then((value) {
        var count = value.docs.length;

        if (count == 0) {
          Fluttertoast.showToast(
            msg: "User account does not exist.",
            timeInSecForIosWeb: 5,
            gravity: ToastGravity.TOP,
          );
          Navigator.of(context).pop();
        } else if (count >= 1) {
          sendRequest(email);
        }
      });
    } on FirebaseAuthException catch (e) {
      // Error authentication
      Fluttertoast.showToast(
        msg: e.message!,
        timeInSecForIosWeb: 5,
        gravity: ToastGravity.TOP,
      );
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }

  // send reset password request function
  void sendRequest(String email) async {
    if (_formKey.currentState!.validate()) {
      try {
        _auth.sendPasswordResetEmail(email: email);
        Fluttertoast.showToast(
          msg: "Request sent successfully!",
          timeInSecForIosWeb: 5,
          gravity: ToastGravity.TOP,
        );
        Navigator.of(context).pop();
      } on FirebaseAuthException catch (e) {
        // Error authentication
        Fluttertoast.showToast(
          msg: e.message!,
          timeInSecForIosWeb: 5,
          gravity: ToastGravity.TOP,
        );
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      }
    }
  }
}
