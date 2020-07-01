import 'package:flutter/material.dart';
import 'package:wassil/main.dart';
import 'package:getflutter/getflutter.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    controller = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // todo: take care of this later
      /*floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Container(
          width: 80,
          height: 80,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Color(0xff3CB979)),
          child: SvgPicture.asset(
            "assets/Groupe 12.svg",
            width: 37,
            height: 37,
          ),
        ),
      ),*/
      backgroundColor: ThemeColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: ThemeColors.backgroundLight,
              pinned: true,
              snap: true,
              floating: true,
              expandedHeight: 198.0,
              // **Is it intended ?** flexibleSpace.title overlaps with tabs title.
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SvgPicture.asset(
                            'assets/left_menu.svg',
                            height: 28.000003814697266,
                            width: 28,
                          ),
                          Spacer(),
                          new Container(
                            height: 28.00,
                            width: 140.00,
                            padding: EdgeInsets.symmetric(horizontal: 14),
                            decoration: BoxDecoration(
                              color: Color(0xff161d24),
                              borderRadius: BorderRadius.circular(14.00),
                            ),
                            child: Center(
                              child: Text(
                                "30 May 2020",
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.headline4,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 28.00,
                            width: 28.00,
                            decoration: BoxDecoration(
                              color: Color(0xff161d24),
                              borderRadius: BorderRadius.circular(28.00),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Container(
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
                    ],
                  ),
                ),
              ),

              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(90),
                child: Theme(
                  data: Theme.of(context).copyWith(accentColor: Colors.white),
                  child: Stack(children: <Widget>[
                    AnimatedContainer(
                      duration: Duration(milliseconds: 400),
                      curve: Curves.easeInOutQuart,
                      margin: EdgeInsets.only(
                        top: (90 / 2) + 34,
                        left: (controller.index == 0)?
                        Offset(MediaQuery.of(context).size.width / 4, 206.0)
                            .dx -
                            36 / 2 : Offset((MediaQuery.of(context).size.width / 4)*3, 206.0)
                            .dx -
                            56 / 2 ,
                      ),
                      height: 3,
                      width: (controller.index == 0)? 36: 56,
                      decoration: BoxDecoration(
                          color: ThemeColors.mainGreen,
                          borderRadius: BorderRadius.circular(100)),
                    ),
                    Row(
                      children: <Widget>[
                        /// Local Tabbar
                        InkWell(
                          onTap: () {
                            setState(() {
                              controller.index = 0;
                            });
                          },
                          splashColor: ThemeColors.backgroundLighter,
                          highlightColor: ThemeColors.backgroundLighter,
                          child: Container(
                            alignment: Alignment.center,
                            color: Colors.transparent,
                            height: 90,
                            width: (MediaQuery.of(context).size.width) / 2,
                            child: Center(
                                child: (controller.index == 0)
                                    ? Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Image(
                                            height: 40,
                                            image: AssetImage(
                                              'assets/png/localActive.png',
                                            ),
                                          ),
                                          SizedBox(height: 6,),
                                          Text(
                                            'Local',
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context).textTheme.headline1,
                                          ),
                                        ],
                                      )
                                    : Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Image(
                                            height: 40,
                                            image: AssetImage(
                                              'assets/png/local.png',
                                            ),
                                          ),
                                          SizedBox(height: 6,),
                                          Text(
                                            'Local',
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context).textTheme.headline2,
                                          )
                                        ],
                                      )),
                          ),
                        ),

                        /// National Tabbar
                        InkWell(
                          onTap: () {
                            setState(() {
                              controller.index = 1;
                            });
                          },
                          splashColor: ThemeColors.backgroundLighter,
                          highlightColor: ThemeColors.backgroundLighter,
                          child: Container(
                            alignment: Alignment.center,
                            color: Colors.transparent,
                            height: 90,
                            width: (MediaQuery.of(context).size.width) / 2,
                            child: Center(
                                child: (controller.index == 1)
                                    ? Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Image(
                                            height: 40,
                                            image: AssetImage(
                                              'assets/png/nationalActive.png',
                                            ),
                                          ),
                                          SizedBox(height: 6,),
                                          Text(
                                            'National',
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context).textTheme.headline1,
                                          ),
                                        ],
                                      )
                                    : Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Image(
                                            height: 40,
                                            image: AssetImage(
                                              'assets/png/national.png',
                                            ),
                                          ),
                                          SizedBox(height: 6,),
                                          Text(
                                            'National',
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context).textTheme.headline2,
                                          )
                                        ],
                                      )),
                          ),
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
            ),
            // SliverList(
            SliverFillRemaining(
              child: TabBarView(
                controller: controller,
                children: <Widget>[
                  /// todo: add page
                  Container(
                    color: Colors.red,
                  ),
                  Container(
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NewsListElement extends StatelessWidget {
  final String title;
  final String description;
  final String picture;

  NewsListElement(this.title, this.description, this.picture);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: <Widget>[
          Container(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 16,
              ),
              SvgPicture.asset(
                'assets/news.svg',
                height: 40,
                width: 40,
              ),
              SizedBox(
                width: 18,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width - 120,
                          child: new Text(
                            title,
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(),
                        ),
                        InkWell(
                          onTap: () {},
                          child: SvgPicture.asset(
                            "assets/post_options.svg",
                            width: 4,
                            height: 16,
                          ),
                        ),
                        SizedBox(
                          width: 13,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    new Text(
                      "News",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Color(0xff8e9ba7),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    new Text(
                      description,
                      style: TextStyle(
                        fontFamily: "Segoe UI",
                        fontSize: 10,
                        color: Color(0xffc4ced8),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 12),
                      height: 140,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.green,
                          border:
                              Border.all(color: Color(0xff44484F), width: 2),
                          image: DecorationImage(
                              fit: BoxFit.fill, image: NetworkImage(picture))),
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 16, left: 8),
                            child: InkWell(
                              onTap: () {},
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  SvgPicture.asset(
                                    "assets/commenter.svg",
                                    width: 16,
                                    height: 16,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Center(
                                    child: Text(
                                      "Commenter",
                                      style: TextStyle(
                                        fontFamily: "Segoe UI",
                                        fontSize: 10,
                                        color: Color(0xffc4ced8),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 60,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16, left: 8),
                            child: InkWell(
                              onTap: () {},
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  SvgPicture.asset(
                                    "assets/voir plus.svg",
                                    width: 16,
                                    height: 16,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Center(
                                    child: Text(
                                      "Voir plus",
                                      style: TextStyle(
                                        fontFamily: "Segoe UI",
                                        fontSize: 10,
                                        color: Color(0xffc4ced8),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ]),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ],
          )),
          Divider(
            color: Color(0xff44484F),
            thickness: 1.5,
          ),
        ],
      ),
    );
  }
}

class ProjectListElement extends StatelessWidget {
  final String title;
  final String description;
  final String picture;

  ProjectListElement(this.title, this.description, this.picture);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: <Widget>[
          Container(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 16,
              ),
              SvgPicture.asset(
                'assets/projet.svg',
                height: 40,
                width: 40,
              ),
              SizedBox(
                width: 18,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width - 120,
                          child: new Text(
                            title,
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(),
                        ),
                        InkWell(
                          onTap: () {},
                          child: SvgPicture.asset(
                            "assets/post_options.svg",
                            width: 4,
                            height: 16,
                          ),
                        ),
                        SizedBox(
                          width: 13,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    new Text(
                      "Projet",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Color(0xff8e9ba7),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    new Text(
                      description,
                      style: TextStyle(
                        fontFamily: "Segoe UI",
                        fontSize: 10,
                        color: Color(0xffc4ced8),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 12),
                      height: 140,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.green,
                          border:
                              Border.all(color: Color(0xff44484F), width: 2),
                          image: DecorationImage(
                              fit: BoxFit.fill, image: NetworkImage(picture))),
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 16, left: 8),
                            child: InkWell(
                              onTap: () {},
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  SvgPicture.asset(
                                    "assets/commenter.svg",
                                    width: 16,
                                    height: 16,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Center(
                                    child: Text(
                                      "Commenter",
                                      style: TextStyle(
                                        fontFamily: "Segoe UI",
                                        fontSize: 10,
                                        color: Color(0xffc4ced8),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 60,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16, left: 8),
                            child: InkWell(
                              onTap: () {},
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  SvgPicture.asset(
                                    "assets/voir plus.svg",
                                    width: 16,
                                    height: 16,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Center(
                                    child: Text(
                                      "Voir plus",
                                      style: TextStyle(
                                        fontFamily: "Segoe UI",
                                        fontSize: 10,
                                        color: Color(0xffc4ced8),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ]),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ],
          )),
          Divider(
            color: Color(0xff44484F),
            thickness: 1.5,
          ),
        ],
      ),
    );
  }
}

class SondageListElement extends StatelessWidget {
  final String title;
  final String description;
  final String picture;

  SondageListElement(this.title, this.description, this.picture);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: <Widget>[
          Container(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 16,
              ),
              SvgPicture.asset(
                'assets/poll.svg',
                height: 40,
                width: 40,
              ),
              SizedBox(
                width: 18,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width - 120,
                          child: new Text(
                            title,
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(),
                        ),
                        InkWell(
                          onTap: () {},
                          child: SvgPicture.asset(
                            "assets/post_options.svg",
                            width: 4,
                            height: 16,
                          ),
                        ),
                        SizedBox(
                          width: 13,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    new Text(
                      "Sondage",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Color(0xff8e9ba7),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    new Text(
                      description,
                      style: TextStyle(
                        fontFamily: "Segoe UI",
                        fontSize: 10,
                        color: Color(0xffc4ced8),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 12),
                      width: MediaQuery.of(context).size.width,
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Color(0xff44484F), width: 2),
                      ),
                      child: Column(
                        children: <Widget>[],
                      ),
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 16, left: 8),
                            child: InkWell(
                              onTap: () {},
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  SvgPicture.asset(
                                    "assets/commenter.svg",
                                    width: 16,
                                    height: 16,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Center(
                                    child: Text(
                                      "Commenter",
                                      style: TextStyle(
                                        fontFamily: "Segoe UI",
                                        fontSize: 10,
                                        color: Color(0xffc4ced8),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 60,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16, left: 8),
                            child: InkWell(
                              onTap: () {},
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  SvgPicture.asset(
                                    "assets/voir plus.svg",
                                    width: 16,
                                    height: 16,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Center(
                                    child: Text(
                                      "Voir plus",
                                      style: TextStyle(
                                        fontFamily: "Segoe UI",
                                        fontSize: 10,
                                        color: Color(0xffc4ced8),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ]),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ],
          )),
          Divider(
            color: Color(0xff44484F),
            thickness: 1.5,
          ),
        ],
      ),
    );
  }
}
