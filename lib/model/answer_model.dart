class AnswerModel {
  String? ques1;
  String? ques2;
  String? ques3;
  String? ques4;
  String? ques5;
  int? score;

  AnswerModel({
    this.ques1,
    this.ques2,
    this.ques3,
    this.ques4,
    this.ques5,
    this.score,
  });

  // receive data from server
  factory AnswerModel.fromMap(map) {
    return AnswerModel(
      ques1: map['ques1'],
      ques2: map['ques2'],
      ques3: map['ques3'],
      ques4: map['ques4'],
      ques5: map['ques5'],
      score: map['score'],
    );
  }

  // send data to server
  Map<String, dynamic> toMap() {
    return {
      'ques1': ques1,
      'ques2': ques2,
      'ques3': ques3,
      'ques4': ques4,
      'ques5': ques5,
      'score': score,
    };
  }
}
