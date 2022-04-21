import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../widgets/next_button_widget.dart';

class ResultPage extends StatefulWidget {
  ResultPage({required this.result, Key? key}) : super(key: key);

  String result;
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      //child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          Lottie.asset("assets/finish.json"),
          const Text(
            "You are more of an ",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30,
                decoration: TextDecoration.none,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w300,
                color: Colors.black),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            widget.result.toUpperCase(),
            style: const TextStyle(
                fontSize: 35,
                decoration: TextDecoration.none,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w700,
                color: Colors.pink),
          ),
          const SizedBox(
            height: 60,
          ),
          NextButton(
            btnText: "Try again?",
          )
        ],
        //  ),
      ),
    );
  }
}
