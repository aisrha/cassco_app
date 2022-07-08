import 'package:casscoapp/model/user_model.dart';
import 'package:casscoapp/screens/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Firebase
  final _auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;

  // form key
  final _formKey = GlobalKey<FormState>();

  // User model
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // editing controller
    final firstNameEditingController = TextEditingController(
      text: loggedInUser.firstName,
    );
    final secondNameEditingController = TextEditingController(
      text: loggedInUser.secondName,
    );

    // first name field
    final firstNameField = TextFormField(
      autofocus: false,
      controller: firstNameEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{2,}$');
        if (value!.isEmpty) {
          return ("First name is required");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter valid first name (min 2 chars)");
        }
        return null;
      },
      onSaved: (value) {
        firstNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "First Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    // second name field
    final secondNameField = TextFormField(
      autofocus: false,
      controller: secondNameEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{2,}$');
        if (value!.isEmpty) {
          return ("Second name is required");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter valid second name (min 2 chars)");
        }
        return null;
      },
      onSaved: (value) {
        secondNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Second Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    // email field
    final emailField = TextFormField(
      readOnly: true,
      onTap: () {
        Fluttertoast.showToast(
          msg: "Email is not editable",
          timeInSecForIosWeb: 5,
          gravity: ToastGravity.TOP,
        );
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          labelText: "Email",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: "${loggedInUser.email}",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    // change password button
    final changePasswordButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color.fromARGB(255, 216, 215, 215),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(horizontal: 38),
        // minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          _auth.sendPasswordResetEmail(email: loggedInUser.email.toString());
          Fluttertoast.showToast(
            msg: "Change password request has been sent to your email",
            timeInSecForIosWeb: 5,
            gravity: ToastGravity.TOP,
          );
        },
        child: const Text(
          "Change Password",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 17,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    // save button
    final saveButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.green,
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 38),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            UserModel userModel = UserModel();
            userModel.email = user!.email;
            userModel.uid = user!.uid;
            userModel.firstName = firstNameEditingController.text;
            userModel.secondName = secondNameEditingController.text;
            updateProfileDetails(userModel);
          }
        },
        child: const Text(
          "Save",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 17,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(25),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text(
                "Edit Profile",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 45),
              firstNameField,
              const SizedBox(height: 25),
              secondNameField,
              const SizedBox(height: 25),
              emailField,
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  changePasswordButton,
                  const SizedBox(width: 10),
                  saveButton,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void updateProfileDetails(UserModel user) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .update(user.toMap());
    Fluttertoast.showToast(
      msg: "Profile is successfully updated!",
      timeInSecForIosWeb: 5,
      gravity: ToastGravity.TOP,
    );
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
  }
}
