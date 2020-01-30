import 'package:flutter/material.dart';
import 'package:neotelemetri_or11/Models/ParalaxIntroSlider/dot_animation_enum.dart';
import 'package:neotelemetri_or11/Models/ParalaxIntroSlider/intro_slider.dart';
import 'package:neotelemetri_or11/Models/ParalaxIntroSlider/slide_object.dart';
import 'package:neotelemetri_or11/Constant/Constant.dart';

class ParalaxIntroSlider extends StatefulWidget {
  @override
  IntroSliderState createState() => new IntroSliderState();
}

class IntroSliderState extends State<ParalaxIntroSlider> {
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "PROGRAMMING",
        styleTitle: TextStyle(
            color: Colors.black, fontSize: 25.0, fontFamily: 'OpenSansBold'),
        pathImage: "assets/images/logo_divisi_prog.png",
        backgroundImage: 'assets/images/intro_1.png',
      ),
    );
    slides.add(
      new Slide(
        title: "MULTIMEDIA & DESAIN",
        styleTitle: TextStyle(
            color: Colors.black, fontSize: 25.0, fontFamily: 'OpenSansBold'),
        pathImage: "assets/images/logo_divisi_mmd.png",
        backgroundImage: 'assets/images/intro_2.png',
      ),
    );
    slides.add(
      new Slide(
        title: "SISTEM KOMPUTER & JARINGAN",
        maxLineTitle: 2,
        styleTitle: TextStyle(
            color: Colors.black, fontSize: 25.0, fontFamily: 'OpenSansBold'),
        pathImage: "assets/images/logo_divisi_skj.png",
        backgroundImage: 'assets/images/intro_3.png',
      ),
    );
  }

  void onDonePress() {
    Navigator.of(context).pushReplacementNamed(LOGIN_SCREEN);
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Colors.white,
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Color(0xffB8529E),
      size: 35.0,
    );
  }

  Widget renderPrevBtn() {
    return Icon(
      Icons.navigate_before,
      color: Color(0xffB8529E),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      slides: this.slides,
      renderPrevBtn: this.renderPrevBtn(),
      colorPrevBtn: Color(0xffF5F6F8),
      highlightColorPrevBtn: Colors.transparent,
      renderNextBtn: this.renderNextBtn(),
      colorNextBtn: Color(0xffB8529E),
      highlightColorNextBtn: Colors.transparent,
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: this.onDonePress,
      colorDoneBtn: Colors.white,
      highlightColorDoneBtn: Colors.transparent,
      colorDot: Color(0xffB8529E),
      colorActiveDot: Color(0xff8051A0),
      sizeDot: 13.0,
      typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,
      backgroundColorAllSlides: Colors.transparent,
      shouldHideStatusBar: false,
    );
  }
}
