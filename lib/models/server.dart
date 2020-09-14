import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:simpleshop/models/question.dart';


class ServerRepository {

  var url = 'https://jsonkeeper.com/b/WUU8';
  Map<String, String> headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  Future<List<QuestionsModel>> getData() async {
    http.Response response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<QuestionsModel> questions = [];
      for (int i = 0; i < body.length; i++) {
        questions.add(QuestionsModel.fromJson(body[i]));
      }
      return questions;
    } else {
      throw 'error';
    }
  }
}