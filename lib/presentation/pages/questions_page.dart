import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personality_test/data/datasource/questions_remote_data_source.dart';
import 'package:personality_test/data/repository/repository.dart';
import 'package:personality_test/presentation/cubit/cubit/questions_cubit.dart';
import 'package:personality_test/presentation/pages/result_page.dart';
import 'package:personality_test/presentation/widgets/error_view.dart';
import 'package:personality_test/presentation/widgets/questions_view_widget.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({Key? key}) : super(key: key);

  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
            create: (context) => QuestionCubit(QuestionsRepository(
                remoteDataSource: QuestionsRemoteDataSource())),
            child: BlocConsumer<QuestionCubit, QuestionsState>(
                listener: (context, state) {
              if (state is ResultCalculated) {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (c, a1, a2) => ResultPage(
                      result: state.result,
                    ),
                    transitionsBuilder: (c, anim, a2, child) =>
                        FadeTransition(opacity: anim, child: child),
                    transitionDuration: const Duration(milliseconds: 800),
                  ),
                );
              }
            }, builder: (context, state) {
              if (state is QuestionsLoaded) {
                return QuestionsView(questionsList: state.questionsList);
              } else if (state is QuestionsFailedToLoad) {
                return ErrorView(errorMsg: state.error);
              } else {
                return Center(
                  child: Container(
                      height: 100,
                      width: 100,
                      child: const CircularProgressIndicator(
                        color: Color(0xFF34C9C6),
                      )),
                );
              }
            })));
  }
}
