import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:neotelemetri_or11/Models/First/question.dart';

const String baseUrl = "https://opentdb.com/api.php?amount=2&category=9&difficulty=hard";
const String url = "http://10.108.7.84/ioms11/exam.php";

//Category category, int total, String difficulty

Future<List<Question>> getQuestions() async {
//  String url = "$baseUrl?amount=$total&category=${category.id}";
//  if(difficulty != null) {
//    url = "$url&difficulty=$difficulty";
//  }
  http.Response res = await http.get(url);
//  return json.decode(res.body);
  List<Map<String, dynamic>> questions = List<Map<String,dynamic>>.from(json.decode(res.body)["results"]);
  print(questions);
  return Question.fromData(questions);
}