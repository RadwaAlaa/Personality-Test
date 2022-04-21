part of 'questions_cubit.dart';

abstract class QuestionsState extends Equatable {}

class QuestionsInitial extends QuestionsState {
  @override
  List<Object?> get props => [];
}

class QuestionsLoaded extends QuestionsState {
  QuestionsLoaded({required this.questionsList});
  final List<Question> questionsList;
  @override
  List<Object?> get props => [questionsList];
}

class ResultCalculated extends QuestionsState {
  ResultCalculated({required this.result});
  final String result;
  @override
  List<Object?> get props => [result];
}

class QuestionsFailedToLoad extends QuestionsState {
  QuestionsFailedToLoad({required this.error});
  final String error;
  @override
  List<Object?> get props => [error];
}
