import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:neotelemetri_or11/Screen/LoginPage.dart';
import 'package:neotelemetri_or11/Screen/ParalaxIntroSlider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AnimatedSplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<AnimatedSplashScreen>
  with SingleTickerProviderStateMixin{

  var _visible = true;

  AnimationController animationController;
  Animation<double> animation,animation2;

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new LoginPage()));
    } else {
      prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new ParalaxIntroSlider()));
    }
  }

//  @override
//  void initState() {
//    super.initState();
//    new Timer(new Duration(milliseconds: 300), () {
//      checkFirstSeen();
//    });
//  }

  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, () {
      checkFirstSeen();
    });
  }

//  void navigationPage() {
//    Navigator.of(context).pushReplacementNamed(PARALAX_INTRO);
//  }

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, 
        duration: new Duration(seconds: 1));
    animation =
    new CurvedAnimation(parent: animationController, curve: Curves.linearToEaseOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

Animatable<Color> background = TweenSequence<Color>([
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: Color(0xffBF63A8),
        end: Color(0xff8051A0),
      ),
    ),
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background.evaluate(AlwaysStoppedAnimation(animationController.value)),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                  padding:
                  EdgeInsets.only(bottom: 30.0),
                  child:
                  new Image.asset('assets/images/logo_neo.png', height: 25.0,fit: BoxFit.scaleDown,))


            ],
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset(
                'assets/images/logo_or_11.png',
                width: animation.value * 250,
                height: animation.value * 250,
              ),
            ],
          ),
        ],
      ),
    );
  }
}