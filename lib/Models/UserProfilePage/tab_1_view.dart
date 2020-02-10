import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:neotelemetri_or11/Models/LoginPage/login_theme.dart' as Theme;
import 'package:neotelemetri_or11/Models/UserProfilePage/box_list_view.dart';
import 'package:neotelemetri_or11/Models/UserProfilePage/religion_gender_blood_list_view.dart';
import 'package:neotelemetri_or11/appTheme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Tab1View extends StatefulWidget {
  @override
  State createState() => new Tab1ViewState();
}

class Tab1ViewState extends State<Tab1View>
    with TickerProviderStateMixin<Tab1View> {
  // checkProfile() async {
  //   var urlLogin = 'https://or.neotelemetri.com/view/mobile_login.php';
  //   final response =
  //       await http.post(urlLogin, body: {"email": email, "password": password});
  //   final data = jsonDecode(response.body);
  //   int value = data['value'];
  //   String message = data['message'];
  //   String emailAPI = data['email'];
  //   String nameAPI = data['name'];
  // }

  final double infoHeight = 164.0;
  AnimationController animationController;
  Animation<double> animation, delayedAnimation1;
  double opacity1 = 0.0;
  double opacity2 = 0.0;
  double opacity3 = 0.0;
  double opacity4 = 0.0;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    getPref();
    setData();
    super.initState();
  }

  Future<void> setData() async {
    animationController.forward();
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity1 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity2 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity3 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity4 = 1.0;
    });
  }

  String name = "", email = "", alamat = "";

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      name = preferences.getString("name");
      email = preferences.getString("email");
      alamat = preferences.getString("alamat");
    });
  }

  @override
  Widget build(BuildContext context) {
    final double tempHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).size.width / 1.2) +
        280.0;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
            bottomLeft: Radius.circular(35),
            bottomRight: Radius.circular(35),
          ),
          color: AppTheme.nearlyWhite),
      padding: new EdgeInsets.only(bottom: 10.0, top: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          constraints: BoxConstraints(
              minHeight: infoHeight,
              maxHeight: tempHeight > infoHeight ? tempHeight : infoHeight),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 22, right: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: AnimatedOpacity(
                        opacity: opacity1,
                        duration: const Duration(milliseconds: 500),
                        child: Text(
                          // 'Budi Agung Santoso',
                          '$name',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontFamily: 'OpenSansBold',
                            fontSize: 32,
                            letterSpacing: 0.25,
                            color: AppTheme.darkText,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: AnimatedOpacity(
                          opacity: opacity1,
                          duration: const Duration(milliseconds: 500),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 28),
                            child: Text(
                              'Jalan Universitas Andalas, Limau Manis, Kec. Pauh, Kota Padang',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontFamily: 'OpenSansBold',
                                fontSize: 15,
                                letterSpacing: 0.27,
                                color: AppTheme.darkText,
                              ),
                            ),
                          )),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.place,
                      color: Theme.Colorss.loginGradientEnd,
                      size: 20,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18),
                child: AnimatedOpacity(
                  opacity: opacity2,
                  duration: const Duration(milliseconds: 500),
                  child: ReligionGenderBloodListView(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 22, right: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: AnimatedOpacity(
                        opacity: opacity3,
                        duration: const Duration(milliseconds: 500),
                        child: Text(
                          'roby.zulfahri@gmail.com',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: AppTheme.fontName,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            letterSpacing: 0.15,
                            color: AppTheme.darkText,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: AnimatedOpacity(
                          opacity: opacity3,
                          duration: const Duration(milliseconds: 500),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              '+62 823 9060 7249',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontFamily: 'OpenSansBold',
                                fontSize: 15,
                                letterSpacing: 0.27,
                                color: AppTheme.darkText,
                              ),
                            ),
                          )),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.phone_android,
                      color: Theme.Colorss.loginGradientEnd,
                      size: 20,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: AnimatedOpacity(
                  opacity: opacity4,
                  duration: const Duration(milliseconds: 500),
                  child: BoxListView(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getBoxUI(String text1, String text2) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: new LinearGradient(
            colors: [Color(0xffEB9AD7), Color(0xffBF63A8)],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0),
            topRight: Radius.circular(0),
            bottomLeft: Radius.circular(35),
            bottomRight: Radius.circular(35),
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: AppTheme.dark_grey.withOpacity(0.3),
                offset: const Offset(0.0, -5.1),
                blurRadius: 8.0),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 18.0, right: 18.0, top: 12.0, bottom: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                text1,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'OpenSansBold',
                    fontSize: 14,
                    letterSpacing: 0.27,
                    color: AppTheme.nearlyWhite),
              ),
              Text(
                text2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'OpenSansBoldItalic',
                  fontSize: 14,
                  letterSpacing: 0.27,
                  color: AppTheme.nearlyBlack,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
