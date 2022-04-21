import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../widgets/next_button_widget.dart';

class ErrorView extends StatefulWidget {
  ErrorView({required this.errorMsg, Key? key}) : super(key: key);

  String errorMsg;
  @override
  _ErrorViewState createState() => _ErrorViewState();
}

class _ErrorViewState extends State<ErrorView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      //child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 40,
          ),
          const Text(
            "Error",
            style: TextStyle(
                fontSize: 35,
                decoration: TextDecoration.none,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w700,
                color: Colors.pink),
          ),
          const SizedBox(
            height: 45,
          ),
          Lottie.asset("assets/error_animation.json"),
          Text(
            widget.errorMsg,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 15,
                decoration: TextDecoration.none,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w300,
                color: Colors.black),
          ),
          const SizedBox(
            height: 15,
          ),
          NextButton(btnText: "Refresh")
        ],
        //  ),
      ),
    );
  }
}
