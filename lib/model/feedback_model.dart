class FeedbackModel {
  String? timestamp;
  String? feedback;

  FeedbackModel({this.timestamp, this.feedback});

  // receive data from server
  factory FeedbackModel.fromMap(map) {
    return FeedbackModel(
      timestamp: map['timestamp'],
      feedback: map['feedback'],
    );
  }

  // send data to server
  Map<String, dynamic> toMap() {
    return {
      'timestamp': timestamp,
      'feedback': feedback,
    };
  }
}
