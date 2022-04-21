import 'package:dartz/dartz.dart';
import 'package:personality_test/data/model/question_model.dart';

abstract class IQuestions {
  Future<Either<String, List<Question>>> getAllQuestions();
}
