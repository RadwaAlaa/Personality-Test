import 'package:dartz/dartz.dart';
import 'package:personality_test/data/datasource/questions_remote_data_source.dart';
import 'package:personality_test/data/model/question_model.dart';
import 'package:personality_test/domain/i_repository.dart';

class QuestionsRepository implements IQuestions {
  QuestionsRepository({required this.remoteDataSource});

  final QuestionsRemoteDataSource remoteDataSource;

  @override
  Future<Either<String, List<Question>>> getAllQuestions() {
    return remoteDataSource.getRemoteQuestionsList();
  }
}
