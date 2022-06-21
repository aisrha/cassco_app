import 'package:casscoapp/model/answer_model.dart';
import 'package:flutter/material.dart';

class FormativeDetailScreen extends StatefulWidget {
  FormativeDetailScreen({
    Key? key,
    required this.ansModel,
    required this.attemptName,
    required this.formativeTopic,
  }) : super(key: key);

  final AnswerModel ansModel;
  final String attemptName;
  final String formativeTopic;

  @override
  State<FormativeDetailScreen> createState() => _FormativeDetailScreenState();
}

class _FormativeDetailScreenState extends State<FormativeDetailScreen> {
  @override
  Widget build(BuildContext context) {
    AnswerModel model = widget.ansModel;

    // build list view builder
    buildListViewBuilder() {
      return ListView.builder(
        itemCount: model.questionList!.length,
        itemBuilder: (context, index) {
          var count = (index + 1).toString();
          bool isCorrect = false;
          if (model.correctList![index] == model.userAnsList![index]) {
            isCorrect = true;
          } else if (model.correctList![index] != model.userAnsList![index]) {
            isCorrect = false;
          }
          return Card(
            elevation: 5,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Question ' + count,
                      style: const TextStyle(
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      model.questionList![index],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(model.userAnsList![index]),
                    subtitle: isCorrect
                        ? Text('Correct!')
                        : Text('Answer: ' + model.correctList![index]),
                    trailing: isCorrect
                        ? const Icon(
                            Icons.done,
                            color: Colors.green,
                          )
                        : const Icon(
                            Icons.close,
                            color: Colors.red,
                          ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close),
        ),
        title: Text(widget.formativeTopic + ' Performance'),
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(23),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.attemptName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            SizedBox(height: 15),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Your marks : ' +
                    model.score.toString() +
                    ' / ' +
                    model.questionList!.length.toString(),
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Attempted on : ' + model.created.toString(),
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(height: 15),
            Expanded(
              child: buildListViewBuilder(),
            ),
          ],
        ),
      ),
    );
  }
}
