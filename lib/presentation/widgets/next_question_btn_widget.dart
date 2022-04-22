import 'package:flutter/material.dart';

class NextQuestionButton extends StatelessWidget {
  NextQuestionButton({
    required this.btnText,
    required this.isNextBtnEnabled,
    required this.btnClickedFn,
    Key? key,
  }) : super(key: key);

  bool isNextBtnEnabled;
  String btnText;
  Function btnClickedFn;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width - 40,
        enableFeedback: isNextBtnEnabled,
        color: isNextBtnEnabled
            ? const Color(0xFF34C9C6)
            : const Color(0XFFCCd6E0),
        child: Text(btnText),
        onPressed: () => btnClickedFn(context),
      ),
    );
  }
}
