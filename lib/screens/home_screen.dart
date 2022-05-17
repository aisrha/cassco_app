import 'dart:async';

import 'package:casscoapp/model/user_model.dart';
import 'package:casscoapp/screens/homepage_screen.dart';
import 'package:casscoapp/screens/login_screen.dart';
import 'package:casscoapp/screens/note_screen.dart';
import 'package:casscoapp/screens/profile_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  bool isEmailVerified = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    // verified email auth
    isEmailVerified = user!.emailVerified;

    if (!isEmailVerified) {
      // send verification email after login
      sendVerificationEmail();

      // auto logout
      timer =
          Timer.periodic(const Duration(seconds: 30), (_) => logout(context));
    }

    // logged in user data
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future sendVerificationEmail() async {
    try {
      await user!.sendEmailVerification();
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        timeInSecForIosWeb: 5,
        gravity: ToastGravity.TOP,
      );
    }
  }

  int currentIndex = 0;
  final screens = [
    HomePageScreen(),
    NoteScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? Scaffold(
          appBar: AppBar(
            title: Text("CASSCO"),
            backgroundColor: Colors.orangeAccent,
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  logout(context);
                },
                icon: Icon(
                  Icons.logout,
                  color: Colors.black,
                ),
              )
            ],
          ),
          body: IndexedStack(
            index: currentIndex,
            children: screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.orangeAccent,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white70,
            currentIndex: currentIndex,
            onTap: (index) => setState(() {
              currentIndex = index;
            }),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: "Notes",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
              )
            ],
          ),
        )
      // : Center(child: Text("Verify Email", style: TextStyle(fontSize: 60)));
      : Scaffold(
          appBar: AppBar(
            title: Text("Verify Email"),
            backgroundColor: Colors.orangeAccent,
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  logout(context);
                },
                icon: Icon(
                  Icons.logout,
                  color: Colors.black,
                ),
              )
            ],
          ),
          body: Center(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 150,
                    child: Image.asset("assets/logo.png", fit: BoxFit.contain),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Kindly verify your email to proceed",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Account will be logged out in 30 seconds...",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Fluttertoast.showToast(
      msg: "Logged out successfully",
      timeInSecForIosWeb: 5,
      gravity: ToastGravity.TOP,
    );
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
