import 'package:flutter/material.dart';
import 'package:personality_test/presentation/pages/questions_page.dart';

class NextButton extends StatelessWidget {
  NextButton({
    required this.btnText,
    Key? key,
  }) : super(key: key);
  String btnText;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: const Color(0xFF34C9C6),
      child: Text(btnText),
      onPressed: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (c, a1, a2) => const QuestionsPage(),
            transitionsBuilder: (c, anim, a2, child) =>
                FadeTransition(opacity: anim, child: child),
            transitionDuration: const Duration(milliseconds: 800),
          ),
        );
      },
    );
  }
}
