import 'package:personality_test/data/datasource/questions_remote_data_source.dart';
import 'package:personality_test/data/model/question_model.dart';
import 'package:personality_test/data/repository/repository.dart';
import 'package:personality_test/presentation/cubit/cubit/questions_cubit.dart';
import 'package:test/test.dart';

void main() {
  group('questions Cubit', () {
    test('default is empty', () {
      var cubit = QuestionCubit(
          QuestionsRepository(remoteDataSource: QuestionsRemoteDataSource()));
      expect(cubit.state.props.length, 0);
    });

    test('get questions', () async {
      var cubit = QuestionCubit(
          QuestionsRepository(remoteDataSource: QuestionsRemoteDataSource()));
      await cubit.getAllQuestions();
      expect((cubit.state.props[0] as List<Question>)[0].questionText,
          "You’re really busy at work and a colleague is telling you their life story and personal woes. You");
    });

//should turn off wifi or data first.
    test('questions failed to load', () async {
      var cubit = QuestionCubit(
          QuestionsRepository(remoteDataSource: QuestionsRemoteDataSource()));
      await cubit.getAllQuestions();
      expect(cubit.state.props[0], "Connection Error!");
    });
  });
}
