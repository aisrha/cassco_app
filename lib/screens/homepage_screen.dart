import 'package:casscoapp/model/user_model.dart';
import 'package:casscoapp/widgets/feedback_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatefulWidget {
  HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  User? user = FirebaseAuth.instance.currentUser;
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
    // Feedback Card
    final feedbackCard = Card(
        elevation: 10,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(23, 20, 23, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Help us improve!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                    child:
                        Image.asset("assets/feedback.png", fit: BoxFit.contain),
                  ),
                  SizedBox(width: 30),
                  SizedBox(
                    width: 200,
                    child: Text(
                      'We would love to hear your feedback on our application. Click the button below to submit your feedback.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => FeedbackDialog());
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.lightGreen),
                    ),
                    child: Text(
                      'Submit Feedback',
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));

    return Scaffold(
      // body: Center(
      //   child: Padding(
      //     padding: EdgeInsets.all(20),
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: <Widget>[
      //         SizedBox(
      //           height: 150,
      //           child: Image.asset("assets/logo.png", fit: BoxFit.contain),
      //         ),
      //         SizedBox(height: 20),
      //         Text(
      //           "Welcome Back",
      //           style: TextStyle(
      //             fontSize: 20,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //         SizedBox(height: 10),
      //         Text(
      //           "${loggedInUser.firstName} ${loggedInUser.secondName}",
      //           style:
      //               TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
      //         ),
      //         Text(
      //           "${loggedInUser.email}",
      //           style:
      //               TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
      //         )
      //       ],
      //     ),
      //   ),
      // ),
      body: ListView(
        padding: EdgeInsets.all(23),
        children: <Widget>[
          Text(
            'Hello, ${loggedInUser.firstName}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          SizedBox(height: 25),
          SizedBox(
            height: 200,
            child: Image.asset("assets/hello.png", fit: BoxFit.contain),
          ),
          SizedBox(height: 25),
          feedbackCard,
        ],
      ),
    );
  }
}
