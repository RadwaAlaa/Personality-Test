import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personality_test/data/model/answer_model.dart';
import 'package:personality_test/data/model/question_model.dart';
import 'package:personality_test/presentation/widgets/questions_view_widget.dart';

void main() {
  group('QuestionsView', () {
    List<Question> questions = <Question>[];
    questions.add(Question(answers: <Answer>[], questionText: "Question 1"));
    questions.add(Question(answers: <Answer>[], questionText: "Question 2"));

    _pumpTestWidget(WidgetTester tester) => tester.pumpWidget(
          MaterialApp(home: QuestionsView(questionsList: questions)),
        );

    testWidgets('quistions loaded state', (WidgetTester tester) async {
      await _pumpTestWidget(tester);
      expect(find.byType(ListView), findsOneWidget);
      expect(find.text("1- Question 1"), findsWidgets);
    });
  });
}
