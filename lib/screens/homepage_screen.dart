import 'package:casscoapp/model/user_model.dart';
import 'package:casscoapp/screens/faq_screen.dart';
import 'package:casscoapp/widgets/feedback_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'notes/topic1_screen.dart';
import 'notes/topic2_screen.dart';
import 'notes/topic3_screen.dart';

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
      loggedInUser = UserModel.fromMap(value.data());
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

    // FAQ Card
    final faqCard = Card(
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
                'Frequently Asked Questions',
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
                    child: Image.asset("assets/faq.png", fit: BoxFit.contain),
                  ),
                  SizedBox(width: 30),
                  SizedBox(
                    width: 200,
                    child: Text(
                      'Do you have questions regarding CASSCO? Click the button below to view our frequently asked questions and answers list.',
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FaqScreen()));
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.lightGreen),
                    ),
                    child: Text(
                      'List of FAQ & Answers',
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));

    buildHorizontalCards() {
      return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('words').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong!');
          }
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SizedBox(
            height: 290,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: snapshot.data!.docs.map((document) {
                var lastIndex = document.id.contains('word07');

                checkLastIndex() {
                  if (!lastIndex) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Swipe for more '),
                        Icon(Icons.arrow_forward_sharp),
                      ],
                    );
                  } else {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(''),
                      ],
                    );
                  }
                }

                checkNoteTopic() {
                  if (document['wordTopic'] == '1') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Topic1Screen()));
                  } else if (document['wordTopic'] == '2') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Topic2Screen()));
                  } else if (document['wordTopic'] == '3') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Topic3Screen()));
                  }
                }

                return Card(
                  elevation: 3,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(23, 20, 23, 10),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              document['wordText'],
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 20),
                            const Text(
                              'Definition: ',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 20),
                            SizedBox(
                              width: 290,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        document['wordDesc'],
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            ButtonBar(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    checkNoteTopic();
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.lightGreen),
                                  ),
                                  child: Text(
                                    'Go To Topic ${document["wordTopic"]}',
                                    style: const TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                            checkLastIndex(),
                            // Row(
                            //   mainAxisSize: MainAxisSize.min,
                            //   children: [
                            //     Text('Swipe for more '),
                            //     Icon(Icons.arrow_forward_sharp),
                            //   ],
                            // )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        },
      );
    }

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(23),
        children: <Widget>[
          Text(
            'Hello, ${loggedInUser.firstName} ${loggedInUser.secondName}',
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
          buildHorizontalCards(),
          SizedBox(height: 10),
          feedbackCard,
          SizedBox(height: 10),
          faqCard,
        ],
      ),
    );
  }
}
