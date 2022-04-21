import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:personality_test/data/model/question_model.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

enum APIMethod { get, post, put, delete, patch }

class QuestionsRemoteDataSource {
  Future<List<Question>> getLocalQuestionsList() async {
    final String response =
        await rootBundle.loadString('assets/questions.json');
    final data = await json.decode(response);
    List<dynamic> resultList = data['questions'];
    List<Question> questionsList = <Question>[];
    for (var element in resultList) {
      questionsList.add(Question.fromJson(element));
    }
    return questionsList;
  }

  Future<Either<String, List<Question>>> getRemoteQuestionsList() async {
    try {
      Map<String, String> originalHeaders = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
      var client = http.Client();

      var url = Uri.https(
          "818a914f-ca28-4c63-bfaf-89a128b7c536.mock.pstmn.io", "/questions");
      Response response = http.Response("", 200);

      response = await client.get(url, headers: originalHeaders);

      if (response.statusCode == 200) {
        final data = await json.decode(response.body);
        List<dynamic> resultList = data['questions'];
        List<Question> questionsList = <Question>[];
        for (var element in resultList) {
          questionsList.add(Question.fromJson(element));
        }

        return right(questionsList);
      } else {
        return Left(response.body);
      }
    } on SocketException {
      return const Left("Connection Error!");
    } catch (e) {
      return Left(e.toString());
      //no network e
    }
  }
}
