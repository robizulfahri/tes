import 'package:flutter/material.dart';
import 'package:neotelemetri_or11/Constant/Constant.dart';
import 'package:neotelemetri_or11/Models/LoginPage/login_theme.dart' as Theme;
import 'package:neotelemetri_or11/Models/UserProfilePage/avatar_glow.dart';
import 'package:neotelemetri_or11/Models/UserProfilePage/tab_view.dart';
import 'package:neotelemetri_or11/Screen/LoginPage.dart';
import 'package:neotelemetri_or11/appTheme.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key key, this.animationController, this.signOut})
      : super(key: key);
  final AnimationController animationController;
  final VoidCallback signOut;

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage>
    with TickerProviderStateMixin {
  LoginStatus _loginStatus = LoginStatus.notSignIn;

  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", null);
      preferences.commit();
      _loginStatus = LoginStatus.notSignIn;
    });
    if (value == 0) {
      Navigator.of(context).pushReplacementNamed(LOGIN_SCREEN);
    }
  }

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.getInt("value");
      _loginStatus = value == 1 ? LoginStatus.signIn : LoginStatus.notSignIn;
    });
    if (_loginStatus == LoginStatus.notSignIn) {
      Navigator.of(context).pushReplacementNamed(LOGIN_SCREEN);
    }
    ;
  }

  var value;

  Animation<double> topBarAnimation;

  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

  @override
  void initState() {
    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: widget.animationController,
            curve: Interval(0, 0.5, curve: Curves.fastOutSlowIn)));
    addAllListData();

    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          setState(() {
            topBarOpacity = 1.0;
          });
        }
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          setState(() {
            topBarOpacity = scrollController.offset / 24;
          });
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          setState(() {
            topBarOpacity = 0.0;
          });
        }
      }
    });
    super.initState();
  }

  void addAllListData() {
    const int count = 2;

    listViews.add(
      AvatarGlow(
        duration: Duration(milliseconds: 2000),
        endRadius: 140,
        shape: BoxShape.circle,
        repeatPauseDuration: Duration(milliseconds: 100),
        repeat: true,
        glowColor: AppTheme.eminence,
        showTwoGlows: true,
        startDelay: Duration(milliseconds: 10),
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/images/avatar.jpg'),
          radius: 70.0,
        ),
        animation1: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 1, 1.0, curve: Curves.fastOutSlowIn))),
        controller: widget.animationController,
      ),
    );

    listViews.add(
      TabView(),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppTheme.nearlyWhite),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            getMainListViewUI(),
            getAppBarUI(),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
          ],
        ),
      ),
    );
  }

  Widget getMainListViewUI() {
    return FutureBuilder<bool>(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        } else {
          return ListView.builder(
            controller: scrollController,
            padding: EdgeInsets.only(
              top: AppBar().preferredSize.height +
                  MediaQuery.of(context).padding.top +
                  24,
              bottom: 62 + MediaQuery.of(context).padding.bottom,
            ),
            itemCount: listViews.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              widget.animationController.forward();
              return listViews[index];
            },
          );
        }
      },
    );
  }

  Widget getAppBarUI() {
    return Column(
      children: <Widget>[
        AnimatedBuilder(
          animation: widget.animationController,
          builder: (BuildContext context, Widget child) {
            return FadeTransition(
              opacity: topBarAnimation,
              child: Transform(
                transform: Matrix4.translationValues(
                    0.0, 30 * (1.0 - topBarAnimation.value), 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppTheme.white.withOpacity(topBarOpacity),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(32.0),
                      bottomRight: Radius.circular(32.0),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: AppTheme.grey.withOpacity(0.4 * topBarOpacity),
                          offset: const Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).padding.top,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 16 - 8.0 * topBarOpacity,
                            bottom: 12 - 8.0 * topBarOpacity),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Profile',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: AppTheme.fontName,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 22 + 6 - 6 * topBarOpacity,
                                    letterSpacing: 1.2,
                                    color: AppTheme.darkerText,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 38,
                              width: 38,
                              child: Center(
                                child: IconButton(
                                  onPressed: () {
                                    var alert = Alert(
                                      style: alertStyle,
                                      context: context,
                                      title: ("Oh no!"),
                                      desc: "You're leaving...\nAre you sure?",
                                      image: Image.asset(
                                          "assets/images/logout.png",
                                          width: 50,
                                          height: 50),
                                      content: Column(
                                        children: <Widget>[
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(25.0)),
                                                gradient: new LinearGradient(
                                                    colors: [
                                                      Theme.Colorss
                                                          .loginGradientStart,
                                                      Theme.Colorss
                                                          .loginGradientEnd,
                                                    ],
                                                    begin:
                                                        const FractionalOffset(
                                                            0.2, 0.2),
                                                    end: const FractionalOffset(
                                                        1.0, 1.0),
                                                    stops: [0.0, 1.0],
                                                    tileMode: TileMode.clamp),
                                              ),
                                              child: MaterialButton(
                                                highlightColor:
                                                    Colors.transparent,
                                                splashColor: Colors.transparent,
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 10.0,
                                                      horizontal: 19.0),
                                                  child: Text(
                                                    "Naah, Just Kidding",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontFamily:
                                                            AppTheme.fontName,
                                                        color: AppTheme.white,
                                                        fontSize: 18),
                                                  ),
                                                ),
                                              )),
                                        ],
                                      ),
                                      buttons: [
                                        DialogButton(
                                          child: Text(
                                            "Yes, Log Me Out",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: AppTheme.eminence,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: AppTheme.fontName,
                                                fontSize: 18),
                                          ),
                                          onPressed: () {
                                            signOut();
                                          },
                                          color: AppTheme.white,
                                        )
                                      ],
                                    );
                                    alert.show();
                                  },
                                  icon: Icon(Icons.power_settings_new),
                                  color: AppTheme.darkerText,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }

  var alertStyle = AlertStyle(
    animationType: AnimationType.fromTop,
    isCloseButton: false,
    isOverlayTapDismiss: false,
    descStyle: TextStyle(fontFamily: AppTheme.fontName),
    animationDuration: Duration(milliseconds: 400),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
      side: BorderSide(
        color: Colors.transparent,
      ),
    ),
    titleStyle: TextStyle(
      fontFamily: AppTheme.fontName,
      color: Colors.red,
    ),
  );
}
