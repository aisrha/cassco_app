// ignore_for_file: unnecessary_new

import 'package:casscoapp/screens/formative/formative1_screen.dart';
import 'package:casscoapp/screens/notes/topic1_screen.dart';
import 'package:casscoapp/screens/notes/topic2_screen.dart';
import 'package:casscoapp/screens/notes/topic3_screen.dart';
import 'package:casscoapp/screens/summative_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'formative/formative2_screen.dart';
import 'formative/formative3_screen.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    // check assessment attempt
    Future checkAttempt(String dbCollection) async {
      return FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .collection(dbCollection)
          .get()
          .then(
        (value) {
          var count = value.docs.length;

          if (count >= 2) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: const Text(
                  'Oops! Sorry, you have exceeded the 2 attempt(s) limit.'),
              action: SnackBarAction(
                label: 'Dismiss',
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
              ),
            ));
          } else if (count < 2) {
            if (dbCollection == 'topic1') {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Formative1Screen()));
            } else if (dbCollection == 'topic2') {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Formative2Screen()));
            } else if (dbCollection == 'topic3') {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Formative3Screen()));
            } else if (dbCollection == 'summative') {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SummativeScreen()));
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Please try again later. Thank you.'),
              action: SnackBarAction(
                label: 'Dismiss',
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
              ),
            ));
          }
        },
      );
    }

    // topic 1 card
    final buildTopic1Card = Card(
        elevation: 5,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                      Color.fromARGB(255, 220, 220, 220), BlendMode.darken),
                  child: Image.asset(
                    "assets/topic1.png",
                    fit: BoxFit.fill,
                  ),
                ),
                const Positioned(
                  bottom: 16,
                  right: 16,
                  left: 16,
                  child: Text(
                    'Topic 1 : Introduction to CSS',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16).copyWith(bottom: 0),
              child: const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'In this topic, you will learn : \n \u2022 CSS Syntax \n \u2022 CSS Selectors \n \u2022 CSS Comments',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Topic1Screen()));
                  },
                  child: const Text(
                    'Notes',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    checkAttempt('topic1');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orangeAccent,
                    elevation: 3,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                    ),
                  ),
                  child: const Text(
                    'Attempt Formative',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ));

    // topic 2 card
    final buildTopic2Card = Card(
        elevation: 5,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ColorFiltered(
                  colorFilter:
                      const ColorFilter.mode(Colors.grey, BlendMode.darken),
                  child: Image.asset(
                    "assets/topic2.png",
                    fit: BoxFit.fill,
                  ),
                ),
                const Positioned(
                  bottom: 16,
                  right: 16,
                  left: 16,
                  child: Text(
                    'Topic 2 : Ways to insert CSS',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16).copyWith(bottom: 0),
              child: const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'In this topic, you will learn the ways to insert CSS in your code : \n \u2022 External Style Sheet \n \u2022 Internal Style Sheet \n \u2022 Inline style',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Topic2Screen()));
                  },
                  child: const Text(
                    'Notes',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    checkAttempt('topic2');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orangeAccent,
                    elevation: 3,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                    ),
                  ),
                  child: const Text(
                    'Attempt Formative',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ));

    // topic 3 card
    final buildTopic3Card = Card(
        elevation: 5,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ColorFiltered(
                  colorFilter:
                      const ColorFilter.mode(Colors.grey, BlendMode.softLight),
                  child: Image.asset(
                    "assets/topic3.png",
                    fit: BoxFit.fill,
                  ),
                ),
                const Positioned(
                  bottom: 16,
                  right: 16,
                  left: 16,
                  child: Text(
                    'Topic 3 : Styling',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16).copyWith(bottom: 0),
              child: const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'In this topic, you will learn a few different types of styling in CSS : \n \u2022 Text Styling \n \u2022 Font Styling \n \u2022 Background styling \n \u2022 Tables styling \n \u2022 Border styling \n \u2022 Position styling',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Topic3Screen()));
                  },
                  child: const Text(
                    'Notes',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    checkAttempt('topic3');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orangeAccent,
                    elevation: 3,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                    ),
                  ),
                  child: const Text(
                    'Attempt Formative',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ));

    // all topic card
    final buildEndTopic = Card(
        elevation: 5,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ColorFiltered(
                  colorFilter:
                      const ColorFilter.mode(Colors.grey, BlendMode.softLight),
                  child: Image.asset(
                    "assets/topicEnd.png",
                    fit: BoxFit.fill,
                  ),
                ),
                const Positioned(
                  bottom: 16,
                  right: 16,
                  left: 16,
                  child: Text(
                    'Summative Assessment',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16).copyWith(bottom: 0),
              child: const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Test your knowledge on all topics : \n \u2022 Topic 1 - Introduction to CSS \n \u2022 Topic 2 - Ways to insert CSS \n \u2022 Topic 3 - Styling',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    checkAttempt('summative');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orangeAccent,
                    elevation: 3,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                    ),
                  ),
                  child: const Text(
                    'Attempt Summative',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ));

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          // padding: const EdgeInsets.all(16),
          children: [
            buildTopic1Card,
            const Spacer(),
            buildTopic2Card,
            const Spacer(),
            buildTopic3Card,
            const Spacer(),
            buildEndTopic,
          ],
        ),
      ),
    );
  }
}
