import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:neotelemetri_or11/Models/OnlineExamsPage/question.dart';

String url="https://opentdb.com/api.php?amount=2&category=9&difficulty=easy&type=multiple";

//String url="http://10.108.28.55/_tool/tes.php";

Future<List<Question>> getQuestions()async{
  http.Response response=await http.get(url);
  var json=jsonDecode(response.body);
  List<Question> questions=List<Question>.from(json["results"].map((item)=>Question.fromJson(item)));
  print(questions);
  return questions;
}

//Question getQuestion() {
//  return Question(
//      title: "ini adalah pertanyaan",
//      incorrectAnswers: ["satu","dua",],
//      correctAnswer:"ini jawaban"
//  );
//}

Question getQuestion() {
  return Question(
      title: "What was the name of the Ethiopian Wolf before they knew it was related to wolves?",
      incorrectAnswers: ["Amharic Fox","Simien Jackel",],
      correctAnswer:"Ethiopian Coyote"
  );
}
