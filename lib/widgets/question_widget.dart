import 'package:casscoapp/main.dart';
import 'package:casscoapp/model/summative_model.dart';
import 'package:casscoapp/screens/result_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../model/answer_model.dart';
import '../model/question_model.dart';
import '../screens/home_screen.dart';

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({
    Key? key,
    required this.question,
    required this.controller,
  }) : super(key: key);

  final QuestionModel question;
  final PageController controller;

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;
  bool isSelected4 = false;
  bool isAnswered = false;

  String answerChosen = '';

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AppState>(context);
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 32),
          Text(
            widget.question.question.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 8),
          const Text(
            'Choose your answer from below',
            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
          ),
          const SizedBox(height: 32),
          GestureDetector(
            onTap: () {
              setState(() {
                isAnswered = true;
                isSelected1 = !isSelected1;
                if (isSelected2 == true) {
                  isSelected2 = !isSelected2;
                }
                if (isSelected3 == true) {
                  isSelected3 = !isSelected3;
                }
                if (isSelected4 == true) {
                  isSelected4 = !isSelected4;
                }
              });
              answerChosen = widget.question.ans1.toString();
            },
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isSelected1 ? Colors.grey : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      const Text(
                        'A',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(width: 12),
                      SizedBox(
                        width: 280,
                        child: Text(
                          widget.question.ans1.toString(),
                          style: const TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () {
              setState(() {
                isAnswered = true;
                isSelected2 = !isSelected2;
                if (isSelected1 == true) {
                  isSelected1 = !isSelected1;
                }
                if (isSelected3 == true) {
                  isSelected3 = !isSelected3;
                }
                if (isSelected4 == true) {
                  isSelected4 = !isSelected4;
                }
              });
              answerChosen = widget.question.ans2.toString();
            },
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isSelected2 ? Colors.grey : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      const Text(
                        'B',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(width: 12),
                      SizedBox(
                        width: 280,
                        child: Text(
                          widget.question.ans2.toString(),
                          style: const TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () {
              setState(() {
                isAnswered = true;
                isSelected3 = !isSelected3;
                if (isSelected1 == true) {
                  isSelected1 = !isSelected1;
                }
                if (isSelected2 == true) {
                  isSelected2 = !isSelected2;
                }
                if (isSelected4 == true) {
                  isSelected4 = !isSelected4;
                }
              });
              answerChosen = widget.question.ans3.toString();
            },
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isSelected3 ? Colors.grey : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      const Text(
                        'C',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(width: 12),
                      SizedBox(
                        width: 280,
                        child: Text(
                          widget.question.ans3.toString(),
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () {
              setState(() {
                isAnswered = true;
                isSelected4 = !isSelected4;
                if (isSelected1 == true) {
                  isSelected1 = !isSelected1;
                }
                if (isSelected2 == true) {
                  isSelected2 = !isSelected2;
                }
                if (isSelected3 == true) {
                  isSelected3 = !isSelected3;
                }
              });
              answerChosen = widget.question.ans4.toString();
            },
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isSelected4 ? Colors.grey : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      const Text(
                        'D',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(width: 12),
                      SizedBox(
                        width: 280,
                        child: Text(
                          widget.question.ans4.toString(),
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(50),
            child: ElevatedButton(
              onPressed: () {
                if (answerChosen == '') {
                  Fluttertoast.showToast(
                    msg: 'Select an option to continue',
                    timeInSecForIosWeb: 5,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.red,
                  );
                } else if (answerChosen != null) {
                  if (answerChosen == widget.question.correctAns.toString()) {
                    state.addScore(1);
                  }
                  state
                      .addCorrectAnsList(widget.question.correctAns.toString());
                  state.addUserAnsList(answerChosen);
                  print(state.correctAnsList);
                  print(state.userAnswerList);
                  if (widget.question.quesID.toString() == 's1q15' ||
                      widget.question.quesID.toString() == 't1q7' ||
                      widget.question.quesID.toString() == 't2q7' ||
                      widget.question.quesID.toString() == 't3q7') {
                    postUserAnswerToFirestore(state.score, state.userAnswerList,
                        widget.question.quesID.toString());
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => ResultScreen(
                              corAnsList: state.correctAnsList,
                              usAnsList: state.userAnswerList,
                              usScore: state.score,
                            )));
                  } else {
                    state.nextPage();
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 45),
                  textStyle: const TextStyle(fontSize: 20),
                  primary: Colors.lightGreen,
                  onPrimary: Colors.white),
              child: const Text(
                'Save Answer',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  postUserAnswerToFirestore(
      int score, List<String> usAnsList, String quesID) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;

    if (quesID == 's1q15') {
      SummativeAnswerModel sumAnswerModel = SummativeAnswerModel();

      sumAnswerModel.ques1 = usAnsList[0];
      sumAnswerModel.ques2 = usAnsList[1];
      sumAnswerModel.ques3 = usAnsList[2];
      sumAnswerModel.ques4 = usAnsList[3];
      sumAnswerModel.ques5 = usAnsList[4];
      sumAnswerModel.ques6 = usAnsList[5];
      sumAnswerModel.ques7 = usAnsList[6];
      sumAnswerModel.ques8 = usAnsList[7];
      sumAnswerModel.ques9 = usAnsList[8];
      sumAnswerModel.ques10 = usAnsList[9];
      sumAnswerModel.ques11 = usAnsList[10];
      sumAnswerModel.ques12 = usAnsList[11];
      sumAnswerModel.ques13 = usAnsList[12];
      sumAnswerModel.ques14 = usAnsList[13];
      sumAnswerModel.ques15 = usAnsList[14];

      await firebaseFirestore
          .collection("users")
          .doc(user!.uid)
          .collection('summative')
          .add(sumAnswerModel.toMap());
    } else if (quesID == 't1q7' || quesID == 't2q7' || quesID == 't3q7') {
      AnswerModel answerModel = AnswerModel();

      answerModel.ques1 = usAnsList[0];
      answerModel.ques2 = usAnsList[1];
      answerModel.ques3 = usAnsList[2];
      answerModel.ques4 = usAnsList[3];
      answerModel.ques5 = usAnsList[4];
      answerModel.ques6 = usAnsList[5];
      answerModel.ques7 = usAnsList[6];
      answerModel.score = score;

      if (quesID == 't1q7') {
        await firebaseFirestore
            .collection("users")
            .doc(user!.uid)
            .collection('topic1')
            .add(answerModel.toMap());
      } else if (quesID == 't2q7') {
        await firebaseFirestore
            .collection("users")
            .doc(user!.uid)
            .collection('topic2')
            .add(answerModel.toMap());
      } else if (quesID == 't3q7') {
        await firebaseFirestore
            .collection("users")
            .doc(user!.uid)
            .collection('topic3')
            .add(answerModel.toMap());
      }
    }

    // if (mounted) {
    //   Navigator.of(context).pushReplacement(
    //       MaterialPageRoute(builder: (context) => HomeScreen()));
    // }
  }
}
