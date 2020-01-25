import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neotelemetri_or11/Tabs/First.dart';
import 'package:neotelemetri_or11/Tabs/Second.dart';
import 'package:neotelemetri_or11/Tabs/OnlineExamsPage.dart';
import 'package:neotelemetri_or11/Tabs/UserProfilePage.dart';
import 'package:neotelemetri_or11/Models/Dashboard/navigation_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {

  @override
  DashboardState createState() => new DashboardState();
}

class DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static List<Widget> getTabBarView = <Widget>[
    First(),
    Second(),
    OnlineExamsPage(),
    UserProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 1080, height: 2340)..init(context);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Center(
          child: getTabBarView.elementAt(currentIndex),
        ),
        bottomNavigationBar: BottomNavyBar(
          backgroundColor: Colors.black,
          selectedIndex: currentIndex,
          showElevation: true,
          onItemSelected: (index) => setState(() {
            currentIndex = index;
          }),
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.dashboard),
              title: Text('Home',
                  style: TextStyle(
                    fontSize: ScreenUtil(allowFontScaling: true).setSp(40),
                  )),
              activeColor: Colors.red,
            ),
            BottomNavyBarItem(
                icon: Icon(Icons.assignment),
                title: Text('Assignment',
                    style: TextStyle(
                      fontSize: ScreenUtil(allowFontScaling: true).setSp(40),
                    )),
                activeColor: Colors.purpleAccent),
            BottomNavyBarItem(
                icon: Icon(Icons.description),
                title: Text('Exams',
                    style: TextStyle(
                      fontSize: ScreenUtil(allowFontScaling: true).setSp(40),
                    )),
                activeColor: Colors.pink),
            BottomNavyBarItem(
                icon: Icon(Icons.person),
                title: Text('Profile',
                    style: TextStyle(
                      fontSize: ScreenUtil(allowFontScaling: true).setSp(40),
                    )),
                activeColor: Colors.blue),
          ],
        ),
      ),
    );
//    ScreenUtil.instance = ScreenUtil(width: 1080, height: 2340)..init(context);
//    return Scaffold(
//      backgroundColor: Colors.transparent,
//      body: Center(
//        child: getTabBarView.elementAt(currentIndex),
//      ),
//      bottomNavigationBar: BottomNavyBar(
//        backgroundColor: Colors.black,
//        selectedIndex: currentIndex,
//        showElevation: true,
//        onItemSelected: (index) => setState(() {
//          currentIndex = index;
//        }),
//        items: [
//          BottomNavyBarItem(
//            icon: Icon(Icons.dashboard),
//            title: Text('Home',
//                style: TextStyle(
//                  fontSize: ScreenUtil(allowFontScaling: true).setSp(40),
//                )),
//            activeColor: Colors.red,
//          ),
//          BottomNavyBarItem(
//              icon: Icon(Icons.assignment),
//              title: Text('Assignment',
//                  style: TextStyle(
//                    fontSize: ScreenUtil(allowFontScaling: true).setSp(40),
//                  )),
//              activeColor: Colors.purpleAccent),
//          BottomNavyBarItem(
//              icon: Icon(Icons.description),
//              title: Text('Exams',
//                  style: TextStyle(
//                    fontSize: ScreenUtil(allowFontScaling: true).setSp(40),
//                  )),
//              activeColor: Colors.pink),
//          BottomNavyBarItem(
//              icon: Icon(Icons.person),
//              title: Text('Profile',
//                  style: TextStyle(
//                    fontSize: ScreenUtil(allowFontScaling: true).setSp(40),
//                  )),
//              activeColor: Colors.blue),
//        ],
//      ),
//    );
  }
}