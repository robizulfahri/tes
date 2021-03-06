import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neotelemetri_or11/Constant/Constant.dart';
import 'package:neotelemetri_or11/Screen/Dashboard.dart';
import 'package:neotelemetri_or11/Screen/AnimatedSplashScreen.dart';
import 'package:neotelemetri_or11/Screen/ParalaxIntroSlider.dart';
import 'package:neotelemetri_or11/Screen/LoginPage.dart';
import 'package:neotelemetri_or11/Tabs/UserProfilePage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(new MyApp()));
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness:
        Platform.isAndroid ? Brightness.dark : Brightness.light,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarDividerColor: Colors.grey,
    systemNavigationBarIconBrightness: Brightness.dark,
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
        platform: TargetPlatform.iOS,
      ),
      home: AnimatedSplashScreen(),
      routes: <String, WidgetBuilder>{
        ANIMATED_SPLASH: (BuildContext context) => new AnimatedSplashScreen(),
        PARALAX_INTRO: (BuildContext context) => new ParalaxIntroSlider(),
        LOGIN_SCREEN: (BuildContext context) => new LoginPage(),
        DASHBOARD: (BuildContext context) => new Dashboard(),
        FOURTH_TAB: (BuildContext context) => new UserProfilePage(),
      },
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
