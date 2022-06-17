class QuestionModel {
  String? ans1;
  String? ans2;
  String? ans3;
  String? ans4;
  String? correctAns;
  String? question;
  String? quesID;

  QuestionModel({
    this.question,
    this.ans1,
    this.ans2,
    this.ans3,
    this.ans4,
    this.correctAns,
    this.quesID,
  });

  // receive data from server
  factory QuestionModel.fromMap(map) {
    return QuestionModel(
      question: map['question'],
      ans1: map['ans1'],
      ans2: map['ans2'],
      ans3: map['ans3'],
      ans4: map['ans4'],
      correctAns: map['correctAns'],
      quesID: map['quesID'],
    );
  }

  // send data to server
  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'ans1': ans1,
      'ans2': ans2,
      'ans3': ans3,
      'ans4': ans4,
      'correctAns': correctAns,
      'quesID': quesID,
    };
  }
}
