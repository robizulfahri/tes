import 'package:flutter/material.dart';
import 'package:neotelemetri_or11/Models/Dashboard/dashboard_theme.dart';
import 'package:neotelemetri_or11/Models/LoginPage/login_theme.dart' as Theme;
import 'package:neotelemetri_or11/Models/UserProfilePage/tab_1_view.dart';
import 'package:neotelemetri_or11/Models/UserProfilePage/tab_2_view.dart';

class CourseInfoScreen extends StatefulWidget {
  @override
  _CourseInfoScreenState createState() => _CourseInfoScreenState();
}

class _CourseInfoScreenState extends State<CourseInfoScreen>
    with TickerProviderStateMixin {
  final double infoHeight = 464.0;
  AnimationController animationController;
  Animation<double> animation;
  double opacity1 = 0.0;
  double opacity2 = 0.0;
  double opacity3 = 0.0;
  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0, 1.0, curve: Curves.fastOutSlowIn)));
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
  }

  @override
  Widget build(BuildContext context) {
    final double tempHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).size.width / 1.2) +
        240.0;
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: new Transform(
            transform: new Matrix4.translationValues(
                0.0, 30 * (1.0 - animation.value), 0.0),
            child: Container(
                padding: const EdgeInsets.only(
                  top: 2,
                ),
                decoration: BoxDecoration(
                  color: DashboardTheme.nearlyBlack,
                  // color: Color(0xffF2F8F8),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(35.0),
                      topRight: Radius.circular(35.0),
                      bottomLeft: Radius.circular(35.0),
                      bottomRight: Radius.circular(35.0)),
                  boxShadow: [
                    BoxShadow(
                        color: DashboardTheme.grey.withOpacity(0.5),
                        offset: const Offset(1.1, 1.1),
                        blurRadius: 8.0),
                  ],
                ),
                constraints: BoxConstraints(
                    minHeight: infoHeight,
                    maxHeight:
                        tempHeight > infoHeight ? tempHeight : infoHeight),
                child: DefaultTabController(
                  child: Scaffold(
                    primary: false,
                    backgroundColor: Colors.transparent,
                    appBar: PreferredSize(
                      child: TabBar(
                          indicatorColor: Colors.transparent,
                          labelStyle: TextStyle(fontSize: 40),
                          unselectedLabelStyle: TextStyle(fontSize: 20),
                          labelColor: Theme.Colorss.loginGradientStart,
                          unselectedLabelColor: DashboardTheme.nearlyWhite,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicator: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          tabs: [
                            Tab(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "...",
                                  style: TextStyle(
                                    fontFamily: "OpenSansBold",
                                  ),
                                ),
                              ),
                            ),
                            Tab(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "...",
                                  style: TextStyle(
                                    fontFamily: "OpenSansBold",
                                  ),
                                ),
                              ),
                            ),
                          ]),
                      preferredSize: Size.fromHeight(47.0),
                    ),
                    body: TabBarView(children: <Widget>[
                      new Tab1View(),
                      new Tab2View(),
                    ]),
                  ),
                  length: 2,
                )),
          ),
        );
      },
    );
  }
}
