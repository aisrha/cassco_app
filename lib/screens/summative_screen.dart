import 'package:casscoapp/main.dart';
import 'package:casscoapp/model/question_model.dart';
import 'package:casscoapp/widgets/question_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SummativeScreen extends StatefulWidget {
  const SummativeScreen({Key? key}) : super(key: key);

  @override
  State<SummativeScreen> createState() => _SummativeScreenState();
}

class _SummativeScreenState extends State<SummativeScreen> {
  late Stream<QuerySnapshot<Map<String, dynamic>>> _quiz1;
  @override
  void initState() {
    super.initState();
    _quiz1 = FirebaseFirestore.instance.collection('summative').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            state.emptyArrayList();
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close),
        ),
        title: const Text('Summative Assessment'),
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _quiz1,
        builder: (context, snapshot) {
          var state = Provider.of<AppState>(context);
          if (snapshot.hasError) {
            return const Text('Something went wrong!');
          }
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: state.controller,
            children: snapshot.data!.docs
                .map(
                  (question) => QuestionWidget(
                    question: QuestionModel(
                      question: question['question'],
                      ans1: question['ans1'],
                      ans2: question['ans2'],
                      ans3: question['ans3'],
                      ans4: question['ans4'],
                      correctAns: question['correctAns'],
                      quesID: question['quesID'],
                    ),
                    controller: state.controller,
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
