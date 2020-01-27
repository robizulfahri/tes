import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:neotelemetri_or11/Models/UserProfilePage/avatar_glow.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key key, this.animationController}) : super(key: key);

  final AnimationController animationController;
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  String email = "";
  String name = "";

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      name = preferences.getString("name");
      email = preferences.getString("email");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: AvatarGlow(
                duration: Duration(milliseconds: 2000),
                endRadius: 140,
                shape: BoxShape.circle,
                repeatPauseDuration: Duration(milliseconds: 100),
                repeat: true,
                glowColor: Colors.blue,
                showTwoGlows: true,
                startDelay: Duration(milliseconds: 10),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/avatar.jpg'),
                  radius: 70.0,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: new BoxDecoration(
                    color: Color(0xffF5F6F8),
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.white,
                        blurRadius: 10.0,
                      )
                    ],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0))),
                constraints: BoxConstraints.expand(height: 450.0),
                child: ListView(
                  padding:
                      const EdgeInsets.only(top: 20.0, left: 5.0, right: 5.0),
                  physics: BouncingScrollPhysics(),
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '$name',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          '$email',
                          style: TextStyle(
                              fontFamily: 'Montserrat', color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
