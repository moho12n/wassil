
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
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
      ),
      backgroundColor: Color(0xff161d24),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Color(0xff44484F),
            pinned: true,
            snap: true,
            floating: true,
            expandedHeight: 160.0,
            // **Is it intended ?** flexibleSpace.title overlaps with tabs title.
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
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
            ),

            bottom: TabBar(
              tabs: [
                Tab(
                  text: 'Local',
                  icon: Icon(Icons.access_alarm),
                ),
                Tab(
                  text: 'Tab 2',
                  icon: Icon(Icons.access_alarm),
                ),
              ],
              controller: controller,
            ),
          ),
          // SliverList(
          SliverFillRemaining(
            child: TabBarView(
              controller: controller,
              children: <Widget>[
                Container(
                    //height: MediaQuery.of(context).size.height - 300,
                    child: ListView.builder(itemBuilder: (context, item) {
                  return SondageListElement(
                      "Ministère de l'agriculture et du ...",
                      "Programme nationale de reboisement Le Gouvernement a tenu, mercredi 14 août 2019, une réu…",
                      "https://jooinn.com/images/building-project-1.jpg");
                })),
                Center(child: Text("Tab two")),
              ],
            ),
          ),
        ],
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
