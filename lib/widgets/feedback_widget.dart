import 'package:casscoapp/model/feedback_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FeedbackDialog extends StatefulWidget {
  FeedbackDialog({Key? key}) : super(key: key);

  @override
  State<FeedbackDialog> createState() => _FeedbackDialogState();
}

class _FeedbackDialogState extends State<FeedbackDialog> {
  final _auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;

  final TextEditingController feedbackController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  void dispose() {
    feedbackController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: feedbackController,
          keyboardType: TextInputType.multiline,
          decoration: const InputDecoration(
            hintText: 'Enter your feedback here',
            filled: true,
          ),
          maxLines: 5,
          maxLength: 496,
          textInputAction: TextInputAction.done,
          validator: (String? text) {
            if (text == null || text.isEmpty) {
              return 'Please enter a value';
            }
            return null;
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            postDetailsToFirestore();
          },
          child: const Text('Send'),
        ),
      ],
    );
  }

  postDetailsToFirestore() async {
    // call firestore
    // call user model
    // send these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    FeedbackModel feedbackModel = FeedbackModel();

    // writing all values
    feedbackModel.timestamp = DateTime.now().toString();
    feedbackModel.feedback = feedbackController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user!.uid)
        .collection('feedback')
        .add(feedbackModel.toMap());
    Fluttertoast.showToast(
      msg: "Feedback sent successfully!",
      timeInSecForIosWeb: 5,
      gravity: ToastGravity.TOP,
    );
    Navigator.pop(context);
  }
}
