import 'package:personality_test/data/model/answer_model.dart';

class Question {
  String questionText;
  List<Answer> answers;

  Question({required this.answers, required this.questionText});

  static Question fromJson(Map<String, dynamic> json) {
    var answersObj = json["answers"] as List;
    var ansersList =
        answersObj.map<Answer>((json) => Answer.fromJson(json)).toList();
    return Question(answers: ansersList, questionText: json['question']);
  }
}
