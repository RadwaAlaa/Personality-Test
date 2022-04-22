import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slider_indicator/flutter_slider_indicator.dart';
import 'package:personality_test/data/model/question_model.dart';
import 'package:personality_test/presentation/cubit/cubit/questions_cubit.dart';

import 'next_question_btn_widget.dart';

class QuestionsView extends StatefulWidget {
  QuestionsView({required this.questionsList, Key? key}) : super(key: key);

  List<Question> questionsList;
  @override
  _QuestionsViewState createState() => _QuestionsViewState();
}

class _QuestionsViewState extends State<QuestionsView> {
  int idx = 0;
  bool isNextBtnEnabled = false;
  String btnText = "Next";
  Color selectedColor = Colors.white10;
  String headerTxt = "Answer the following questions:";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            headerTxt,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 20,
                fontFamily: "Ariel",
                decoration: TextDecoration.none,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w700,
                color: Colors.pink),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: const Color(0xFF34C9C6)),
              color: const Color(0xFFF5F7F9),
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  (idx + 1).toString() +
                      "- " +
                      widget.questionsList[idx].questionText,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w700),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.questionsList[idx].answers.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          if (widget.questionsList[idx].answers[index]
                                  .isSelected ==
                              false) {
                            setState(() {
                              isNextBtnEnabled = true;
                              for (var element
                                  in widget.questionsList[idx].answers) {
                                if (element.index !=
                                    widget.questionsList[idx].answers[index]
                                        .index) {
                                  element.isSelected = false;
                                }
                              }
                            });
                            widget.questionsList[idx].answers[index]
                                .isSelected = true;
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),

                          //height: 100,
                          decoration: BoxDecoration(
                              color: widget.questionsList[idx].answers[index]
                                      .isSelected
                                  ? const Color.fromARGB(255, 149, 237, 235)
                                  : Colors.white,
                              border: Border.all(
                                  width: 1, color: const Color(0XFFCCd6E0)),
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(
                              widget.questionsList[idx].answers[index].index +
                                  "- " +
                                  widget.questionsList[idx].answers[index]
                                      .answerText),
                        ),
                      );
                    }),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          // ),
        ),
        SliderIndicator(
          length: widget.questionsList.length,
          activeIndex: idx,
          indicator: const Icon(
            Icons.circle_rounded,
            color: Color(0XFFCCd6E0),
            size: 20,
          ),
          activeIndicator: const Icon(
            Icons.circle_rounded,
            color: Color(0xFF34C9C6),
            size: 20,
          ),
        ),
        NextQuestionButton(
          isNextBtnEnabled: isNextBtnEnabled,
          btnText: btnText,
          btnClickedFn: next_btn_clicked,
        )
      ],
    );
  }

  void next_btn_clicked(BuildContext context) {
    if (isNextBtnEnabled) {
      setState(() {
        if (idx < widget.questionsList.length - 1) {
          if (idx == widget.questionsList.length - 2) {
            btnText = "finish";
            headerTxt = "Almost Done!";
          }
          idx++;
          isNextBtnEnabled = false;
        } else {
          if (idx == widget.questionsList.length - 1) {
            setState(() {
              context.read<QuestionCubit>().calculateResult();
            });
          }
        }
      });
    }
  }
}
