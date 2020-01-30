import 'package:flutter/material.dart';
import 'package:neotelemetri_or11/Models/Dashboard/dashboard_theme.dart';
import 'package:neotelemetri_or11/Models/UserProfilePage/avatar_glow.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key key, this.animationController}) : super(key: key);

  final AnimationController animationController;
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage>
    with TickerProviderStateMixin {
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
    // getPref();
  }

  String email = "";
  String name = "";

  // getPref() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   setState(() {
  //     name = preferences.getString("name");
  //     email = preferences.getString("email");
  //   });
  // }

  void addAllListData() {
    const int count = 5;

    listViews.add(
      AvatarGlow(
        duration: Duration(milliseconds: 2000),
        endRadius: 140,
        shape: BoxShape.circle,
        repeatPauseDuration: Duration(milliseconds: 100),
        repeat: true,
        glowColor: Color(0xff8051A0),
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
        animationController1: widget.animationController,
      ),
    );

    listViews.add(
      AvatarGlow(
        duration: Duration(milliseconds: 2000),
        endRadius: 140,
        shape: BoxShape.circle,
        repeatPauseDuration: Duration(milliseconds: 100),
        repeat: true,
        glowColor: Color(0xff8051A0),
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
        animationController1: widget.animationController,
      ),
    );

    listViews.add(
      AvatarGlow(
        duration: Duration(milliseconds: 2000),
        endRadius: 140,
        shape: BoxShape.circle,
        repeatPauseDuration: Duration(milliseconds: 100),
        repeat: true,
        glowColor: Color(0xff8051A0),
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
        animationController1: widget.animationController,
      ),
    );

    listViews.add(
      AvatarGlow(
        duration: Duration(milliseconds: 2000),
        endRadius: 140,
        shape: BoxShape.circle,
        repeatPauseDuration: Duration(milliseconds: 100),
        repeat: true,
        glowColor: Color(0xff8051A0),
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
        animationController1: widget.animationController,
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/coming_soon.png"),
          fit: BoxFit.cover,
        ),
      ),
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
                    color: DashboardTheme.white.withOpacity(topBarOpacity),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(32.0),
                      bottomRight: Radius.circular(32.0),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: DashboardTheme.grey
                              .withOpacity(0.4 * topBarOpacity),
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
                                    fontFamily: 'OpenSansBold',
                                    fontSize: 22 + 6 - 6 * topBarOpacity,
                                    letterSpacing: 1.2,
                                    color: DashboardTheme.darkerText,
                                  ),
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
}
