import 'package:casscoapp/model/answer_model.dart';
import 'package:casscoapp/screens/performance/formativedetail_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FormativePerformanceScreen extends StatefulWidget {
  FormativePerformanceScreen({
    Key? key,
    required this.formativeTopic,
    required this.dbCollection,
  }) : super(key: key);

  final String formativeTopic;
  final String dbCollection;

  @override
  State<FormativePerformanceScreen> createState() =>
      _FormativePerformanceScreenState();
}

class _FormativePerformanceScreenState
    extends State<FormativePerformanceScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close),
        ),
        title: Text('Formative Assessment : ' + widget.formativeTopic),
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid)
            .collection(widget.dbCollection)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong!');
          }
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(23),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Attempts',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Expanded(
                  child: ListView(
                    children: snapshot.data!.docs.map((document) {
                      var attemptName = 'Attempt';
                      Icon attemptIcon = const Icon(Icons.done);
                      if (document.id.toString() == 'attempt1') {
                        attemptName = 'Attempt 1';
                        attemptIcon = const Icon(Icons.filter_1);
                      } else if (document.id.toString() == 'attempt2') {
                        attemptName = 'Attempt 2';
                        attemptIcon = const Icon(Icons.filter_2);
                      }
                      List<String> questionList =
                          List<String>.from(document['questionList']);
                      List<String> correctList =
                          List<String>.from(document['correctList']);
                      List<String> userAnsList =
                          List<String>.from(document['userAnsList']);

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FormativeDetailScreen(
                                        ansModel: AnswerModel(
                                          questionList: questionList,
                                          correctList: correctList,
                                          userAnsList: userAnsList,
                                          created: document['created'],
                                          score: document['score'],
                                        ),
                                        attemptName: attemptName,
                                        formativeTopic: widget.formativeTopic,
                                      )));
                        },
                        child: ListTile(
                          leading: attemptIcon,
                          title: Text(attemptName),
                          subtitle: Text(
                              'Attempted on ' + document['created'].toString()),
                          trailing: CircleAvatar(
                            backgroundColor: Colors.lightGreen,
                            child: Text(document['score'].toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
