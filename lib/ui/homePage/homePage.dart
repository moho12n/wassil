import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:getflutter/getflutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  String dropdownTousValue = "domaine";
  String dropdownDomainValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = new TabController(vsync: this, length: 2, initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GFTabs(
              labelStyle: TextStyle(
                fontFamily: "Product Sans",
                fontSize: 16,
                color: Color(0xff00adb5),
              ),
              tabBarHeight: 60,
              unselectedLabelColor: Color(0xffb7b7b7),
              labelColor: Color(0xff00adb5),
              indicatorColor: Color(0xff00adb5),
              tabBarColor: Colors.transparent,
              length: 2,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 22),
              initialIndex: 0,
              tabs: <Widget>[
                Tab(
                  text: "Profil",
                  icon: Icon(Icons.person),
                ),
                Tab(
                  text: "Badge",
                  icon: Icon(Icons.account_box),
                ),
              ],
              tabBarView: GFTabBarView(
                children: <Widget>[Container(), Container()],
              ))
        ],
      ),
    );
  }
}
