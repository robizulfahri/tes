import 'package:flutter/material.dart';
import 'package:neotelemetri_or11/Models/ParalaxIntroSlider/dot_animation_enum.dart';
import 'package:neotelemetri_or11/Models/ParalaxIntroSlider/intro_slider.dart';
import 'package:neotelemetri_or11/Models/ParalaxIntroSlider/slide_object.dart';
import 'package:neotelemetri_or11/Constant/Constant.dart';
import 'package:neotelemetri_or11/Screen/LoginPage.dart';

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
            color: Colors.black,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans'),
        // description: "",
        // styleDescription: TextStyle(
        //     color: Color(0xffD02090),
        //     fontSize: 20.0,
        //     fontStyle: FontStyle.italic,
        //     fontFamily: 'Raleway'),
        pathImage: "assets/images/logo_programming.png",
        // colorBegin: Color(0xffFFDAB9),
        // colorEnd: Color(0xff40E0D0),
        backgroundImage: 'assets/images/intro_1.png',
        directionColorBegin: Alignment.topLeft,
        directionColorEnd: Alignment.bottomRight,
      ),
    );
    slides.add(
      new Slide(
        title: "MULTIMEDIA & DESAIN",
        styleTitle: TextStyle(
            color: Colors.black,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans'),
        // description: "",
        // styleDescription: TextStyle(
        //     color: Color(0xffD02090),
        //     fontSize: 20.0,
        //     fontStyle: FontStyle.italic,
        //     fontFamily: 'Raleway'),
        pathImage: "assets/images/logo_mmd.png",
        // colorBegin: Color(0xffFFFACD),
        // colorEnd: Color(0xffFF6347),
        backgroundImage: 'assets/images/intro_2.png',
        directionColorBegin: Alignment.topRight,
        directionColorEnd: Alignment.bottomLeft,
      ),
    );
    slides.add(
      new Slide(
        title: "SISTEM KOMPUTER & JARINGAN",
        maxLineTitle: 2,
        styleTitle: TextStyle(
            color: Colors.black,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans'),
        // description: "",
        // styleDescription: TextStyle(
        //     color: Color(0xffD02090),
        //     fontSize: 20.0,
        //     fontStyle: FontStyle.italic,
        //     fontFamily: 'Raleway'),
        pathImage: "assets/images/logo_skj.png",
        // colorBegin: Color(0xffFFA500),
        // colorEnd: Color(0xff7FFFD4),
        backgroundImage: 'assets/images/intro_3.png',
        directionColorBegin: Alignment.topCenter,
        directionColorEnd: Alignment.bottomCenter,
      ),
    );
  }

  void onDonePress() {
    // Do what you want
    Navigator.of(context).pushReplacementNamed(LOGIN_SCREEN);
  }

  void onTabChangeCompleted(index) {
    // Index of current tab is focused
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

  // List<Widget> renderListCustomTabs() {
  //   List<Widget> tabs = new List();
  //   for (int i = 0; i < slides.length; i++) {
  //     Slide currentSlide = slides[i];
  //     tabs.add(Container(
  //       width: double.infinity,
  //       height: double.infinity,
  //       child: Container(
  //         child: ListView(
  //           children: <Widget>[
  //             Padding(padding: EdgeInsets.only(bottom: 130.0)),
  //             GestureDetector(
  //                 child: Image.asset(
  //               currentSlide.pathImage,
  //               width: 250.0,
  //               height: 250.0,
  //               fit: BoxFit.contain,
  //             )),
  //             Container(
  //               child: Text(
  //                 currentSlide.title,
  //                 style: currentSlide.styleTitle,
  //                 textAlign: TextAlign.center,
  //               ),
  //               margin: EdgeInsets.only(top: 70.0),
  //             ),
  //             // Container(
  //             //   child: Text(
  //             //     currentSlide.description,
  //             //     style: currentSlide.styleDescription,
  //             //     textAlign: TextAlign.center,
  //             //     maxLines: 5,
  //             //     overflow: TextOverflow.ellipsis,
  //             //   ),
  //             //   margin: EdgeInsets.only(top: 10.0),
  //             // ),
  //           ],
  //         ),
  //       ),
  //     ));
  //   }
  //   return tabs;
  // }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      // List slides
      slides: this.slides,

      // Prev button
      renderPrevBtn: this.renderPrevBtn(),
      colorPrevBtn: Color(0xffF5F6F8),
      highlightColorPrevBtn: Colors.transparent,

      // Next button
      renderNextBtn: this.renderNextBtn(),
      colorNextBtn: Color(0xffB8529E),
      highlightColorNextBtn: Colors.transparent,

      // Done button
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: this.onDonePress,
      colorDoneBtn: Colors.white,
      highlightColorDoneBtn: Colors.transparent,

      // Dot indicator
      colorDot: Color(0xffB8529E),
      colorActiveDot: Color(0xff8051A0),
      sizeDot: 13.0,
      typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,

      // Tabs
      // listCustomTabs: this.renderListCustomTabs(),
      backgroundColorAllSlides: Colors.transparent,

      // Show or hide status bar
      shouldHideStatusBar: false,
    );
  }
}