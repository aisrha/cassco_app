class AnswerModel {
  List<String>? questionList;
  List<String>? correctList;
  List<String>? userAnsList;
  int? score;
  String? created;

  AnswerModel({
    this.questionList,
    this.correctList,
    this.userAnsList,
    this.score,
    this.created,
  });

  // receive data from server
  factory AnswerModel.fromMap(map) {
    return AnswerModel(
      questionList: List.from(map['questionList']),
      correctList: List.from(map['correctList']),
      userAnsList: List.from(map['userAnsList']),
      score: map['score'],
      created: map['created'],
    );
  }

  // send data to server
  Map<String, dynamic> toMap() {
    return {
      'questionList': questionList,
      'correctList': correctList,
      'userAnsList': userAnsList,
      'score': score,
      'created': created,
    };
  }
}
