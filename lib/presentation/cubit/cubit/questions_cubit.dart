import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:personality_test/data/model/question_model.dart';
import 'package:personality_test/data/repository/repository.dart';

part 'questions_state.dart';

class QuestionCubit extends Cubit<QuestionsState> {
  final QuestionsRepository repository;
  List<Question> questionsList = <Question>[];
  String errorMsg = "";

  QuestionCubit(this.repository) : super(QuestionsInitial()) {
    getAllQuestions();
  }

  getAllQuestions() async {
    var questionsListResult = await repository.getAllQuestions();
    questionsListResult.fold((error) => {errorMsg = error},
        (resultList) => {questionsList = resultList});
    if (questionsListResult.isLeft()) {
      emit(QuestionsFailedToLoad(error: errorMsg));
    } else {
      emit(QuestionsLoaded(questionsList: questionsList));
    }
  }

  void calculateResult() {
    int introverts = 0;
    int extrovert = 0;

    for (var element in questionsList) {
      var selected = element.answers.firstWhere((answer) => answer.isSelected);
      if (selected.type == "introvert") {
        introverts++;
      } else {
        extrovert++;
      }
    }

    if (introverts > extrovert) {
      emit(ResultCalculated(result: "Introvert"));
    } else {
      emit(ResultCalculated(result: "Extrovert"));
    }
  }
}
