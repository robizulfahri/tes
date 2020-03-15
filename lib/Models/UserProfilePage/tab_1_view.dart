import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:neotelemetri_or11/Models/LoginPage/login_theme.dart' as Theme;
import 'package:neotelemetri_or11/Models/UserProfilePage/box_list_view.dart';
import 'package:neotelemetri_or11/Models/UserProfilePage/religion_gender_blood_list_view.dart';
import 'package:neotelemetri_or11/appTheme.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Future<ProfileModel> fetchPost() async {
//   SharedPreferences preferences = await SharedPreferences.getInstance();
//   var urlProfile =
//       'https://or.neotelemetri.com/view/mobile_profile.php?email=' +
//           preferences.getString("email");
//   final response = await http.get(urlProfile);
//   print(urlProfile);

//   if (response.statusCode == 200) {
//     return ProfileModel.fromJson(json.decode(response.body));
//   } else {
//     throw Exception('Failed to load post');
//   }
// }

// class ProfileModel {
//   final int value;
//   final String email;
//   final String name;
//   final String alamat;
//   final String nama_divisi;
//   final String nama_sub_divisi;
//   final String name_faculty;
//   final String name_jurusan;

//   ProfileModel(
//       {this.value,
//       this.email,
//       this.name,
//       this.alamat,
//       this.nama_divisi,
//       this.nama_sub_divisi,
//       this.name_faculty,
//       this.name_jurusan});

//   factory ProfileModel.fromJson(Map<String, dynamic> json) {
//     return ProfileModel(
//       value: json['value'],
//       email: json['email'],
//       name: json['name'],
//       alamat: json['alamat'],
//       nama_divisi: json['nama_divisi'],
//       nama_sub_divisi: json['nama_sub_divisi'],
//       name_faculty: json['name_faculty'],
//       name_jurusan: json['name_jurusan'],
//     );
//   }
// }

class Tab1View extends StatefulWidget {
  @override
  State createState() => new Tab1ViewState();
}

class Tab1ViewState extends State<Tab1View>
    with AutomaticKeepAliveClientMixin<Tab1View> {
  // Future<ProfileModel> profileModel;
  // var loading = false;

  final GlobalKey<RefreshIndicatorState> _refresh =
      GlobalKey<RefreshIndicatorState>();

  Future<void> _lihatProfile() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var urlProfile =
        'https://or.neotelemetri.com/view/mobile_profile.php?email=' +
            preferences.getString("email");
    final response = await http.get(urlProfile);
    print(urlProfile);
    final data = jsonDecode(response.body);
    int value = data['value'];
    String emailAPI = data['email'];
    String nameAPI = data['name'];
    String alamatAPI = data['alamat'];
    String nama_divisiAPI = data['nama_divisi'];
    String nama_sub_divisiAPI = data['nama_sub_divisi'];
    String name_facultyAPI = data['name_faculty'];
    String name_jurusanAPI = data['name_jurusan'];
    if (value == 1) {
      // setState(() {
      //   savePref(value, emailAPI, nameAPI);
      // });
      print(emailAPI);
      print(nameAPI);
      print(alamatAPI);
      print(nama_divisiAPI);
      print(nama_sub_divisiAPI);
      print(name_facultyAPI);
      print(name_jurusanAPI);
    } else {
      print("gagal");
    }
  }

  // savePref(int value, String emailAPI, String nameAPI) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   setState(() {
  //     preferences.setInt("value", value);
  //     preferences.setString("emailAPI", emailAPI);
  //     preferences.setString("nameAPI", nameAPI);
  //     preferences.commit();
  //   });
  // }

  // getPref1() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   setState(() {
  //     emailAPI = preferences.getString("emailAPI");
  //     nameAPI = preferences.getString("nameAPI");
  //     // print(email);
  //   });
  // }

  // checkProfile() async {
  //   var urlProfile =
  //       'https://or.neotelemetri.com/view/mobile_profile.php?email=' + '$email';
  //   final response = await http.get(urlProfile);
  //   final data = jsonDecode(response.body);
  //   int value = data['value'];
  //   String message = data['message'];
  //   String emailAPI = data['email'];
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
    setData();
    super.initState();
    _lihatProfile();
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

  String nameAPI = "AA", emailAPI = "", alamatAPI = "";

  // getPref() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   setState(() {
  //     email = preferences.getString("email");
  //     nameAPI = preferences.getString("nameAPI");
  //     // print(email);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final double tempHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).size.width / 1.2) +
        280.0;

    // super.build(context);

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
                    Text(
                      // 'Budi Agung Santoso',
                      '$nameAPI',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontFamily: AppTheme.fontName,
                        fontSize: 32,
                        letterSpacing: 0.25,
                        color: AppTheme.darkText,
                      ),
                      // child: AnimatedOpacity(
                      //   opacity: opacity1,
                      //   duration: const Duration(milliseconds: 500),
                      //   child: Text(
                      //     // 'Budi Agung Santoso',
                      //     '$nameAPI',
                      //     textAlign: TextAlign.left,
                      //     style: TextStyle(
                      //       fontWeight: FontWeight.w900,
                      //       fontFamily: AppTheme.fontName,
                      //       fontSize: 32,
                      //       letterSpacing: 0.25,
                      //       color: AppTheme.darkText,
                      //     ),
                      //   ),
                      // ),
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
                                fontFamily: AppTheme.fontName,
                                fontWeight: FontWeight.w700,
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
                    fontFamily: AppTheme.fontName,
                    fontWeight: FontWeight.w700,
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
