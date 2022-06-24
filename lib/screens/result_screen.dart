import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({
    Key? key,
    required this.corAnsList,
    required this.usAnsList,
    required this.usScore,
  }) : super(key: key);

  final List<String> corAnsList;
  final List<String> usAnsList;
  final int usScore;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AppState>(context);
    bool isCorrect;
    int quesLength = widget.corAnsList.length;

    String medal = '';
    if (quesLength == 7) {
      if (widget.usScore <= 2) {
        medal = 'assets/bronze.png';
      } else if (widget.usScore >= 3 && widget.usScore <= 5) {
        medal = 'assets/silver.png';
      } else if (widget.usScore >= 6) {
        medal = 'assets/gold.png';
      }
    } else if (quesLength == 15) {
      if (widget.usScore <= 5) {
        medal = 'assets/bronze.png';
      } else if (widget.usScore >= 6 && widget.usScore <= 10) {
        medal = 'assets/silver.png';
      } else if (widget.usScore >= 11) {
        medal = 'assets/gold.png';
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            state.emptyArrayList();
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close),
        ),
        title: const Text('Result'),
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: Image.asset(
                medal,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const Text('Your Marks:'),
                  Text(
                    widget.usScore.toString() + ' / ' + quesLength.toString(),
                    style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: widget.corAnsList.length,
                    itemBuilder: ((context, index) {
                      if (widget.corAnsList[index] == widget.usAnsList[index]) {
                        isCorrect = true;
                      } else {
                        isCorrect = false;
                      }
                      return ListTile(
                        leading: Text('Q' + (index + 1).toString(),
                            style: const TextStyle(
                              fontSize: 20,
                            )),
                        title: Text(widget.usAnsList[index]),
                        subtitle: isCorrect
                            ? const Text('Good job!')
                            : Text(
                                'Correct answer: ' + widget.corAnsList[index]),
                        trailing: isCorrect
                            ? const Icon(
                                Icons.check,
                                color: Colors.green,
                              )
                            : const Icon(
                                Icons.close,
                                color: Colors.red,
                              ),
                      );
                    })))
          ],
        ),
      ),
    );
  }
}
