import 'package:flutter/material.dart';
import 'package:neotelemetri_or11/Models/Dashboard/dashboard_theme.dart';
import 'package:neotelemetri_or11/Models/LoginPage/login_theme.dart' as Theme;
import 'package:neotelemetri_or11/Models/UserProfilePage/box_list_view.dart';
import 'package:neotelemetri_or11/Models/UserProfilePage/religion_gender_blood_list_view.dart';

class Tab1View extends StatefulWidget {
  @override
  State createState() => new Tab1ViewState();
}

class Tab1ViewState extends State<Tab1View>
    with TickerProviderStateMixin<Tab1View> {
  final double infoHeight = 464.0;
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

  @override
  Widget build(BuildContext context) {
    final double tempHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).size.width / 1.2) +
        240.0;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
            bottomLeft: Radius.circular(35),
            bottomRight: Radius.circular(35),
          ),
          color: DashboardTheme.nearlyWhite
          // gradient: new LinearGradient(
          //     colors: [
          //       Theme.Colorss.loginGradientEnd,
          //       Theme.Colorss.loginGradientStart
          //     ],
          //     begin: const FractionalOffset(0.2, 0.2),
          //     end: const FractionalOffset(1.0, 1.0),
          //     stops: [0.0, 1.0],
          //     tileMode: TileMode.clamp),
          ),
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
                          'Budi Agung Santoso',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontFamily: 'OpenSansBold',
                            fontSize: 32,
                            letterSpacing: 0.25,
                            color: DashboardTheme.darkText,
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
                                color: DashboardTheme.darkText,
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
                            fontFamily: 'OpenSansBoldItalic',
                            fontSize: 15,
                            letterSpacing: 0.15,
                            color: DashboardTheme.darkText,
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
                                color: DashboardTheme.darkText,
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

              // Padding(
              //   padding: const EdgeInsets.only(top: 18.0),
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: <Widget>[
              //       Expanded(
              //           child: AnimatedOpacity(
              //         opacity: opacity3,
              //         duration: const Duration(milliseconds: 2000),
              //         child: getBoxUI('Padang', 'Daerah Asal'),
              //       )),
              //       Expanded(
              //           child: AnimatedOpacity(
              //         opacity: opacity4,
              //         duration: const Duration(milliseconds: 2000),
              //         child: getBoxUI('SMA Negeri 1 Padang', 'Sekolah Asal'),
              //       )),
              //       Expanded(
              //           child: AnimatedOpacity(
              //         opacity: opacity5,
              //         duration: const Duration(milliseconds: 2000),
              //         child: getBoxUI('Jakarta, 18 November 2000', 'TTL'),
              //       )),
              //     ],
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 1.0),
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: <Widget>[
              //       Expanded(
              //           flex: 1,
              //           child: AnimatedOpacity(
              //             opacity: opacity6,
              //             duration: const Duration(milliseconds: 2000),
              //             child: Image.asset("assets/images/jk_male.png"),
              //           )),
              //       Expanded(
              //           flex: 1,
              //           child: AnimatedOpacity(
              //             opacity: opacity7,
              //             duration: const Duration(milliseconds: 2000),
              //             child: Image.asset("assets/images/jk_female.png"),
              //           )),
              //       // Expanded(
              //       //     child: AnimatedOpacity(
              //       //   opacity: opacity6,
              //       //   duration: const Duration(milliseconds: 2000),
              //       //   child: Image.asset("assets/images/logo_or_11_2.png"),
              //       // )),
              //     ],
              //   ),
              // ),

              // AnimatedOpacity(
              //   duration: const Duration(milliseconds: 500),
              //   opacity: opacity1,
              //   child: Padding(
              //     padding: const EdgeInsets.all(8),
              //     child: Row(
              //       children: <Widget>[
              //         MealsListView(),
              //         // getTimeBoxUI('2hours', 'Time'),
              //         // getTimeBoxUI('24', 'Seat'),
              //       ],
              //     ),
              //   ),
              // ),

              // Expanded(
              //   child: AnimatedOpacity(
              //     duration: const Duration(milliseconds: 500),
              //     opacity: opacity2,
              //     child: Padding(
              //       padding: const EdgeInsets.only(
              //           left: 16, right: 16, top: 8, bottom: 8),
              //       child: Text(
              //         'Lorem ipsum is simply dummy text of printing & typesetting industry, Lorem ipsum is simply dummy text of printing & typesetting industry.',
              //         textAlign: TextAlign.justify,
              //         style: TextStyle(
              //           fontWeight: FontWeight.w200,
              //           fontSize: 14,
              //           letterSpacing: 0.27,
              //           color: DashboardTheme.grey,
              //         ),
              //         maxLines: 3,
              //         overflow: TextOverflow.ellipsis,
              //       ),
              //     ),
              //   ),
              // ),
              // AnimatedOpacity(
              //   duration: const Duration(milliseconds: 500),
              //   opacity: opacity2,
              //   child: Padding(
              //     padding:
              //         const EdgeInsets.only(left: 16, bottom: 16, right: 16),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       children: <Widget>[
              //         Container(
              //           width: 48,
              //           height: 48,
              //           child: Container(
              //             decoration: BoxDecoration(
              //               color: DashboardTheme.nearlyWhite,
              //               borderRadius: const BorderRadius.all(
              //                 Radius.circular(16.0),
              //               ),
              //               border: Border.all(
              //                   color: DashboardTheme.grey.withOpacity(0.2)),
              //             ),
              //             child: Icon(
              //               Icons.add,
              //               color: DashboardTheme.nearlyBlue,
              //               size: 28,
              //             ),
              //           ),
              //         ),
              //         const SizedBox(
              //           width: 16,
              //         ),
              //         Expanded(
              //           child: Container(
              //             height: 48,
              //             decoration: BoxDecoration(
              //               color: DashboardTheme.nearlyBlue,
              //               borderRadius: const BorderRadius.all(
              //                 Radius.circular(16.0),
              //               ),
              //               boxShadow: <BoxShadow>[
              //                 BoxShadow(
              //                     color: DashboardTheme.nearlyBlue
              //                         .withOpacity(0.5),
              //                     offset: const Offset(1.1, 1.1),
              //                     blurRadius: 10.0),
              //               ],
              //             ),
              //             child: Center(
              //               child: Text(
              //                 'aaaaaa',
              //                 textAlign: TextAlign.left,
              //                 style: TextStyle(
              //                   fontWeight: FontWeight.w600,
              //                   fontSize: 18,
              //                   letterSpacing: 0.0,
              //                   color: DashboardTheme.nearlyWhite,
              //                 ),
              //               ),
              //             ),
              //           ),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: MediaQuery.of(context).padding.bottom,
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(
              //       left: 16, right: 16, bottom: 8, top: 16),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: <Widget>[
              //       Text(
              //         '\$28.99',
              //         textAlign: TextAlign.left,
              //         style: TextStyle(
              //           fontWeight: FontWeight.w200,
              //           fontSize: 22,
              //           letterSpacing: 0.27,
              //           color: DashboardTheme.nearlyBlue,
              //         ),
              //       ),
              //       Container(
              //         child: Row(
              //           children: <Widget>[
              //             Text(
              //               '4.3',
              //               textAlign: TextAlign.left,
              //               style: TextStyle(
              //                 fontWeight: FontWeight.w200,
              //                 fontSize: 22,
              //                 letterSpacing: 0.27,
              //                 color: DashboardTheme.grey,
              //               ),
              //             ),
              //             Icon(
              //               Icons.star,
              //               color: DashboardTheme.nearlyBlue,
              //               size: 24,
              //             ),
              //           ],
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(
              //       left: 16, right: 16, bottom: 8, top: 16),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: <Widget>[
              //       Text(
              //         '\$28.99',
              //         textAlign: TextAlign.left,
              //         style: TextStyle(
              //           fontWeight: FontWeight.w200,
              //           fontSize: 22,
              //           letterSpacing: 0.27,
              //           color: DashboardTheme.nearlyBlue,
              //         ),
              //       ),
              //       Container(
              //         child: Row(
              //           children: <Widget>[
              //             Text(
              //               '4.3',
              //               textAlign: TextAlign.left,
              //               style: TextStyle(
              //                 fontWeight: FontWeight.w200,
              //                 fontSize: 22,
              //                 letterSpacing: 0.27,
              //                 color: DashboardTheme.grey,
              //               ),
              //             ),
              //             Icon(
              //               Icons.star,
              //               color: DashboardTheme.nearlyBlue,
              //               size: 24,
              //             ),
              //           ],
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(
              //       left: 16, right: 16, bottom: 8, top: 16),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: <Widget>[
              //       Text(
              //         '\$28.99',
              //         textAlign: TextAlign.left,
              //         style: TextStyle(
              //           fontWeight: FontWeight.w200,
              //           fontSize: 22,
              //           letterSpacing: 0.27,
              //           color: DashboardTheme.nearlyBlue,
              //         ),
              //       ),
              //       Container(
              //         child: Row(
              //           children: <Widget>[
              //             Text(
              //               '4.3',
              //               textAlign: TextAlign.left,
              //               style: TextStyle(
              //                 fontWeight: FontWeight.w200,
              //                 fontSize: 22,
              //                 letterSpacing: 0.27,
              //                 color: DashboardTheme.grey,
              //               ),
              //             ),
              //             Icon(
              //               Icons.star,
              //               color: DashboardTheme.nearlyBlue,
              //               size: 24,
              //             ),
              //           ],
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(
              //       left: 16, right: 16, bottom: 8, top: 16),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: <Widget>[
              //       Text(
              //         '',
              //         textAlign: TextAlign.left,
              //         style: TextStyle(
              //           fontWeight: FontWeight.w200,
              //           fontSize: 22,
              //           letterSpacing: 0.27,
              //           color: DashboardTheme.nearlyBlue,
              //         ),
              //       ),
              //       Container(
              //         child: Row(
              //           children: <Widget>[
              //             Text(
              //               '4.3',
              //               textAlign: TextAlign.left,
              //               style: TextStyle(
              //                 fontWeight: FontWeight.w200,
              //                 fontSize: 22,
              //                 letterSpacing: 0.27,
              //                 color: DashboardTheme.grey,
              //               ),
              //             ),
              //             Icon(
              //               Icons.star,
              //               color: DashboardTheme.nearlyBlue,
              //               size: 24,
              //             ),
              //           ],
              //         ),
              //       )
              //     ],
              //   ),
              // ),
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
                color: DashboardTheme.dark_grey.withOpacity(0.3),
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
                    color: DashboardTheme.nearlyWhite),
              ),
              Text(
                text2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'OpenSansBoldItalic',
                  fontSize: 14,
                  letterSpacing: 0.27,
                  color: DashboardTheme.nearlyBlack,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget getImageUI(Image image1) {
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: Container(
  //       decoration: BoxDecoration(
  //         // gradient: new LinearGradient(
  //         //   colors: [Color(0xffEB9AD7), Color(0xffBF63A8)],
  //         //   begin: Alignment.bottomRight,
  //         //   end: Alignment.topLeft,
  //         // ),
  //         borderRadius: BorderRadius.only(
  //           topLeft: Radius.circular(0),
  //           topRight: Radius.circular(0),
  //           bottomLeft: Radius.circular(35),
  //           bottomRight: Radius.circular(35),
  //         ),
  //         boxShadow: <BoxShadow>[
  //           BoxShadow(
  //               color: DashboardTheme.dark_grey.withOpacity(0.3),
  //               offset: const Offset(1.1, 1.1),
  //               blurRadius: 8.0),
  //         ],
  //       ),
  //       child: Padding(
  //         padding: const EdgeInsets.only(
  //             left: 18.0, right: 18.0, top: 12.0, bottom: 12.0),
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: <Widget>[
  //             Image(
  //               image1,
  //               // textAlign: TextAlign.center,
  //               // style: TextStyle(
  //               //     fontFamily: 'OpenSansBold',
  //               //     fontSize: 14,
  //               //     letterSpacing: 0.27,
  //               //     color: DashboardTheme.nearlyWhite),
  //             ),
  //             // Text(
  //             //   text2,
  //             //   textAlign: TextAlign.center,
  //             //   style: TextStyle(
  //             //     fontFamily: 'OpenSansBoldItalic',
  //             //     fontSize: 14,
  //             //     letterSpacing: 0.27,
  //             //     color: DashboardTheme.nearlyBlack,
  //             //   ),
  //             // ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // TODO: implement wantKeepAlive
  @override
  bool get wantKeepAlive => true;
}
