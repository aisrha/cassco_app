import 'package:casscoapp/screens/performance/formativeperformance_screen.dart';
import 'package:casscoapp/screens/performance/summativeperformance_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PerformanceScreen extends StatefulWidget {
  PerformanceScreen({Key? key}) : super(key: key);

  @override
  State<PerformanceScreen> createState() => _PerformanceScreenState();
}

class _PerformanceScreenState extends State<PerformanceScreen> {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    // check formative attempt
    Future checkFormativeAttempt(
        String formativeTopic, String dbCollection) async {
      return FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .collection(dbCollection)
          .get()
          .then(
        (value) {
          var count = value.docs.length;

          if (count == 0) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: const Text(
                  'Oops! Sorry, you have not attempted this assesment.'),
              action: SnackBarAction(
                label: 'Dismiss',
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
              ),
            ));
          } else if (count > 0) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FormativePerformanceScreen(
                          formativeTopic: formativeTopic,
                          dbCollection: dbCollection,
                        )));
          }
        },
      );
    }

    // check summative attempt
    Future checkSummativeAttempt() async {
      return FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .collection('summative')
          .get()
          .then(
        (value) {
          var count = value.docs.length;

          if (count == 0) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: const Text(
                  'Oops! Sorry, you have not attempted this assesment.'),
              action: SnackBarAction(
                label: 'Dismiss',
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
              ),
            ));
          } else if (count > 0) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SummativePerformanceScreen()));
          }
        },
      );
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(23),
        child: ListView(
          children: [
            const Text(
              'Performance',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              height: 220,
              child: Image.asset("assets/trophy.png", fit: BoxFit.contain),
            ),
            const SizedBox(height: 25),
            GestureDetector(
              onTap: () {
                checkFormativeAttempt('Topic 1', 'topic1');
              },
              child: const ListTile(
                leading: Icon(Icons.filter_1),
                title: Text('Formative : Topic 1'),
              ),
            ),
            GestureDetector(
              onTap: () {
                checkFormativeAttempt('Topic 2', 'topic2');
              },
              child: ListTile(
                tileColor: Colors.grey.shade100,
                leading: const Icon(Icons.filter_2),
                title: const Text('Formative : Topic 2'),
              ),
            ),
            GestureDetector(
              onTap: () {
                checkFormativeAttempt('Topic 3', 'topic3');
              },
              child: const ListTile(
                leading: Icon(Icons.filter_3),
                title: Text('Formative : Topic 3'),
              ),
            ),
            GestureDetector(
              onTap: () {
                checkSummativeAttempt();
              },
              child: ListTile(
                tileColor: Colors.grey.shade100,
                leading: const Icon(Icons.filter_4),
                title: const Text('Summative : All topics'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
