class SummativeAnswerModel {
  String? ques1;
  String? ques2;
  String? ques3;
  String? ques4;
  String? ques5;
  String? ques6;
  String? ques7;
  String? ques8;
  String? ques9;
  String? ques10;
  String? ques11;
  String? ques12;
  String? ques13;
  String? ques14;
  String? ques15;
  int? score;

  SummativeAnswerModel({
    this.ques1,
    this.ques2,
    this.ques3,
    this.ques4,
    this.ques5,
    this.ques6,
    this.ques7,
    this.ques8,
    this.ques9,
    this.ques10,
    this.ques11,
    this.ques12,
    this.ques13,
    this.ques14,
    this.ques15,
    this.score,
  });

  // receive data from server
  factory SummativeAnswerModel.fromMap(map) {
    return SummativeAnswerModel(
      ques1: map['ques1'],
      ques2: map['ques2'],
      ques3: map['ques3'],
      ques4: map['ques4'],
      ques5: map['ques5'],
      ques6: map['ques6'],
      ques7: map['ques7'],
      ques8: map['ques8'],
      ques9: map['ques9'],
      ques10: map['ques10'],
      ques11: map['ques11'],
      ques12: map['ques12'],
      ques13: map['ques13'],
      ques14: map['ques14'],
      ques15: map['ques15'],
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
      'ques6': ques6,
      'ques7': ques7,
      'ques8': ques8,
      'ques9': ques9,
      'ques10': ques10,
      'ques11': ques11,
      'ques12': ques12,
      'ques13': ques13,
      'ques14': ques14,
      'ques15': ques15,
      'score': score,
    };
  }
}
