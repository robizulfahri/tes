import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neotelemetri_or11/Constant/Constant.dart';
import 'package:neotelemetri_or11/Screen/Dashboard.dart';
import 'package:neotelemetri_or11/Screen/AnimatedSplashScreen.dart';
import 'package:neotelemetri_or11/Screen/ParalaxIntroSlider.dart';
import 'package:neotelemetri_or11/Screen/LoginPage.dart';
import 'package:neotelemetri_or11/Tabs/First.dart';
import 'package:neotelemetri_or11/Tabs/OnlineExamsPage.dart';
import 'package:neotelemetri_or11/Tabs/Second.dart';
import 'package:neotelemetri_or11/Tabs/UserProfilePage.dart';
import 'appTheme.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
  .then((_) => runApp(new MyApp()));
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness:
    Platform.isAndroid ? Brightness.dark : Brightness.light,
//    systemNavigationBarColor: Colors.black,
//    systemNavigationBarDividerColor: Colors.white,
//    systemNavigationBarIconBrightness: Brightness.light,
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OR Neo Telemetri',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: AppTheme.textTheme,
        platform: TargetPlatform.android,
      ),
      home: AnimatedSplashScreen(),
      routes: <String, WidgetBuilder>{
        ANIMATED_SPLASH: (BuildContext context) => new AnimatedSplashScreen(),
        PARALAX_INTRO: (BuildContext context) => new ParalaxIntroSlider(),
        LOGIN_SCREEN: (BuildContext context) => new LoginPage(),
        DASHBOARD: (BuildContext context) => new Dashboard(),
        FIRST_TAB: (BuildContext context) => new First(),
        SECOND_TAB: (BuildContext context) => new Second(),
        THIRD_TAB: (BuildContext context) => new OnlineExamsPage(),
        FOURTH_TAB: (BuildContext context) => new UserProfilePage(),

      },
    );
  }
}