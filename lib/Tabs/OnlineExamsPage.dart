import 'package:flutter/material.dart';
import 'package:neotelemetri_or11/Models/OnlineExamsPage/question.dart';
import 'package:neotelemetri_or11/Models/OnlineExamsPage/quiz_screen.dart';
import 'package:neotelemetri_or11/Models/OnlineExamsPage/bouncing_widget.dart';
import 'package:neotelemetri_or11/Models/OnlineExamsPage/number_timer.dart';
import 'package:neotelemetri_or11/Models/OnlineExamsPage/default_gradient.dart';
import 'package:neotelemetri_or11/Models/OnlineExamsPage/networking.dart'
    as network;
import 'package:neotelemetri_or11/Screen/Dashboard.dart';
import 'package:neotelemetri_or11/Tabs/UserProfilePage.dart';

class OnlineExamsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OnlineExamsPageState();
}

class _OnlineExamsPageState extends State<OnlineExamsPage> {
  bool loading = true;
  int current = 0;

  @override
  void initState() {
    super.initState();
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          decoration: BoxDecoration(gradient: DefaultGradient.defaultGradient),
          child: loading
              ? NumberTimer(onCompleted: () {
                  setState(() {
                    this.loading = false;
                    current++;
                  });
                })
              : current < questions.length
                  ? QuizScreen(
                      question: questions[current],
                      onCompleted: () {
                        setState(() {
                          this.loading = true;
                        });
                      },
                    )
                  : BouncingWidget(
                      duration: Duration(seconds: 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "End",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.15,
                                color: Colors.white,
                                fontWeight: FontWeight.w900),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 10.0),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: RaisedButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                    builder: (context) => Dashboard(),
                                  ));
                                },
                                child: Text(
                                  "Home",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30.0,
                                    fontFamily: 'RobotoMonoBold',
                                  ),
                                ),
                                color: Colors.blue,
                                splashColor: Colors.teal,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
    ); // return Scaffold();
  }

  List<Question> questions = [];

  void refresh() {
    network.getQuestions().then((qques) {
      print(qques.length);
      if (mounted) {
        setState(() {
          questions.clear();
          questions.addAll(qques);
        });
      }
    });
  }
}
