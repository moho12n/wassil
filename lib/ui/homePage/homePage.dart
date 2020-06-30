import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      backgroundColor: Color(0xff161D24),
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            color: Color(0xff44484f),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 24,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 12,
                    ),
                    SvgPicture.asset(
                      'assets/left_menu.svg',
                      height: 28.000003814697266,
                      width: 28,
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    new Container(
                      height: 28.00,
                      width: 140.00,
                      decoration: BoxDecoration(
                        color: Color(0xff161d24),
                        borderRadius: BorderRadius.circular(28.00),
                      ),
                      child: Center(
                        child: new Text(
                          "30 May 2020",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Color(0xffc4ced8),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    new Container(
                      height: 28.00,
                      width: 28.00,
                      decoration: BoxDecoration(
                        color: Color(0xff161d24),
                        borderRadius: BorderRadius.circular(28.00),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                  ],
                ),
                SizedBox(
                  height: 14,
                ),
                new Container(
                  height: 48.00,
                  width: 108.34,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        "assets/Logo.png",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
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
                        text: "local",
                        icon: Icon(Icons.home),
                      ),
                      Tab(
                        text: "National",
                        icon: Icon(Icons.account_box),
                      ),
                    ],
                    tabBarView: GFTabBarView(
                      children: <Widget>[
                        Container(
                            color: Color(0xff161D24),
                            height: MediaQuery.of(context).size.height),
                        Container()
                      ],
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Sample2 extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
                bottom: TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.call), text: "Call"),
                    Tab(icon: Icon(Icons.message), text: "Message"),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              Container(),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}

class SilverAppBarWithTabBarScreen extends StatefulWidget {
  @override
  _SilverAppBarWithTabBarState createState() => _SilverAppBarWithTabBarState();
}

class _SilverAppBarWithTabBarState extends State<SilverAppBarWithTabBarScreen>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
            flexibleSpace: Column(
              children: <Widget>[
                SizedBox(
                  height: 24,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 12,
                    ),
                    SvgPicture.asset(
                      'assets/left_menu.svg',
                      height: 28.000003814697266,
                      width: 28,
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    new Container(
                      height: 28.00,
                      width: 140.00,
                      decoration: BoxDecoration(
                        color: Color(0xff161d24),
                        borderRadius: BorderRadius.circular(28.00),
                      ),
                      child: Center(
                        child: new Text(
                          "30 May 2020",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Color(0xffc4ced8),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    new Container(
                      height: 28.00,
                      width: 28.00,
                      decoration: BoxDecoration(
                        color: Color(0xff161d24),
                        borderRadius: BorderRadius.circular(28.00),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                  ],
                ),
                SizedBox(
                  height: 14,
                ),
                new Container(
                  height: 48.00,
                  width: 108.34,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        "assets/Logo.png",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
            backgroundColor: Color(0xff44484F),
            pinned: true,
            expandedHeight: 180.0,
            bottom: new TabBar(
              tabs: [
                new Tab(text: 'Tab 1'),
                new Tab(text: 'Tab 2'),
              ],
              controller: controller,
            ),
          ),
          new SliverFillRemaining(
            child: Column(
              children: <Widget>[
                TabBarView(
                  controller: controller,
                  children: <Widget>[
                    Text("Tab 1"),
                    Text("Tab 2"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Exemple extends StatefulWidget{
  @override
  _ExempleState createState() => _ExempleState();
}

class _ExempleState extends State<Exemple> {
 @override
Widget build(BuildContext context) {
  return Scaffold(
    body: DefaultTabController(
      length: 2,
      
      child: NestedScrollView(

        headerSliverBuilder: (context, value) {
          return [
            SliverAppBar(
              bottom: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.call), text: "Call"),
                  Tab(icon: Icon(Icons.message), text: "Message"),
                ],
              ),
            ),
          ];
        },
        body: TabBarView(
          children: [
            Container(color: Colors.green,),
            Container(),
          ],
        ),
      ),
    ),
  );
}
}