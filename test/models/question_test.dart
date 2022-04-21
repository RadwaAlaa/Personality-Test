import 'package:personality_test/data/model/answer_model.dart';
import 'package:personality_test/data/model/question_model.dart';
import 'package:test/test.dart';

void main() {
  group('Testing question model', () {
    var question = Question(answers: <Answer>[], questionText: "");

    test('A new item should be added', () {
      var questionTxt = "question one";
      question.questionText = questionTxt;
      expect(question.questionText.contains(questionTxt), true);
    });
  });
}
