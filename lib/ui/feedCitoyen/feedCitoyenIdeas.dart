import 'package:flutter/material.dart';
import 'package:wassil/controllers/feedCitoyenController.dart';
import 'package:wassil/controllers/feedController.dart';
import 'package:wassil/controllers/propositionController.dart';
import 'package:wassil/main.dart';
import 'package:wassil/models/postModel.dart';

import 'package:wassil/models/post.dart';
import 'package:wassil/models/postNews.dart';
import 'package:wassil/models/postPoll.dart';
import 'package:wassil/models/postProject.dart';
import 'package:getflutter/getflutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wassil/ui/feedCitoyen/elementWidget.dart';

class FeedCitoyenIdeas extends StatefulWidget {
  final VoidCallback toggle;

  const FeedCitoyenIdeas({
    this.toggle,
    Key key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<FeedCitoyenIdeas>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      decoration: BoxDecoration(color: ThemeColors.background, boxShadow: [
        BoxShadow(
            color: Colors.black54,
            offset: Offset(0, 12),
            blurRadius: 24,
            spreadRadius: -12)
      ]),
      child: Stack(
        children: <Widget>[
          CustomScrollView(
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
                            GestureDetector(
                              onTap: widget.toggle,
                              child: SvgPicture.asset(
                                'assets/left_menu.svg',
                                height: 28,
                                width: 28,
                              ),
                            ),
                            Spacer(),
                            new Container(
                              height: 28.00,
                              width: 140.00,
                              padding: EdgeInsets.symmetric(horizontal: 14),
                              decoration: BoxDecoration(
                                color: ThemeColors.background,
                                borderRadius: BorderRadius.circular(14.00),
                              ),
                              child: Center(
                                child: Text(
                                  // TO IGNORE
                                  () {
                                    if (DateTime.now()
                                            .toUtc()
                                            .toString()
                                            .substring(5, 7) ==
                                        '01')
                                      return (DateTime.now()
                                              .toUtc()
                                              .toString()
                                              .substring(0, 4) +
                                          ' Janvier ' +
                                          DateTime.now()
                                              .toUtc()
                                              .toString()
                                              .substring(8, 10));
                                    else if (DateTime.now()
                                            .toUtc()
                                            .toString()
                                            .substring(5, 7) ==
                                        '02')
                                      return (DateTime.now()
                                              .toUtc()
                                              .toString()
                                              .substring(0, 4) +
                                          ' Février ' +
                                          DateTime.now()
                                              .toUtc()
                                              .toString()
                                              .substring(8, 10));
                                    else if (DateTime.now()
                                            .toUtc()
                                            .toString()
                                            .substring(5, 7) ==
                                        '03')
                                      return (DateTime.now()
                                              .toUtc()
                                              .toString()
                                              .substring(0, 4) +
                                          ' Mars ' +
                                          DateTime.now()
                                              .toUtc()
                                              .toString()
                                              .substring(8, 10));
                                    else if (DateTime.now()
                                            .toUtc()
                                            .toString()
                                            .substring(5, 7) ==
                                        '04')
                                      return (DateTime.now()
                                              .toUtc()
                                              .toString()
                                              .substring(0, 4) +
                                          ' Avril ' +
                                          DateTime.now()
                                              .toUtc()
                                              .toString()
                                              .substring(8, 10));
                                    else if (DateTime.now()
                                            .toUtc()
                                            .toString()
                                            .substring(5, 7) ==
                                        '05')
                                      return (DateTime.now()
                                              .toUtc()
                                              .toString()
                                              .substring(0, 4) +
                                          ' Mai ' +
                                          DateTime.now()
                                              .toUtc()
                                              .toString()
                                              .substring(8, 10));
                                    else if (DateTime.now()
                                            .toUtc()
                                            .toString()
                                            .substring(5, 7) ==
                                        '06')
                                      return (DateTime.now()
                                              .toUtc()
                                              .toString()
                                              .substring(0, 4) +
                                          ' Juin ' +
                                          DateTime.now()
                                              .toUtc()
                                              .toString()
                                              .substring(8, 10));
                                    else if (DateTime.now()
                                            .toUtc()
                                            .toString()
                                            .substring(5, 7) ==
                                        '07')
                                      return (DateTime.now()
                                              .toUtc()
                                              .toString()
                                              .substring(0, 4) +
                                          ' Juillet ' +
                                          DateTime.now()
                                              .toUtc()
                                              .toString()
                                              .substring(8, 10));
                                    else if (DateTime.now()
                                            .toUtc()
                                            .toString()
                                            .substring(5, 7) ==
                                        '08')
                                      return (DateTime.now()
                                              .toUtc()
                                              .toString()
                                              .substring(0, 4) +
                                          ' Août ' +
                                          DateTime.now()
                                              .toUtc()
                                              .toString()
                                              .substring(8, 10));
                                    else if (DateTime.now()
                                            .toUtc()
                                            .toString()
                                            .substring(5, 7) ==
                                        '09')
                                      return (DateTime.now()
                                              .toUtc()
                                              .toString()
                                              .substring(0, 4) +
                                          ' Septembre ' +
                                          DateTime.now()
                                              .toUtc()
                                              .toString()
                                              .substring(8, 10));
                                    else if (DateTime.now()
                                            .toUtc()
                                            .toString()
                                            .substring(5, 7) ==
                                        '10')
                                      return (DateTime.now()
                                              .toUtc()
                                              .toString()
                                              .substring(0, 4) +
                                          ' Octobre ' +
                                          DateTime.now()
                                              .toUtc()
                                              .toString()
                                              .substring(8, 10));
                                    else if (DateTime.now()
                                            .toUtc()
                                            .toString()
                                            .substring(5, 7) ==
                                        '11')
                                      return (DateTime.now()
                                              .toUtc()
                                              .toString()
                                              .substring(0, 4) +
                                          ' Novembre ' +
                                          DateTime.now()
                                              .toUtc()
                                              .toString()
                                              .substring(8, 10));
                                    else
                                      return (DateTime.now()
                                              .toUtc()
                                              .toString()
                                              .substring(0, 4) +
                                          ' Decembre ' +
                                          DateTime.now()
                                              .toUtc()
                                              .toString()
                                              .substring(8, 10));
                                  }(),

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
                                color: ThemeColors.background,
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
                    data: Theme.of(context)
                        .copyWith(accentColor: ThemeColors.textColor1),
                    child: Stack(children: <Widget>[
                      AnimatedContainer(
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeInOutQuart,
                        margin: EdgeInsets.only(
                          top: (90 / 2) + 34,
                          left: (controller.index == 0)
                              ? Offset(MediaQuery.of(context).size.width / 4,
                                          206.0)
                                      .dx -
                                  36 / 2
                              : Offset(
                                          (MediaQuery.of(context).size.width /
                                                  4) *
                                              3,
                                          206.0)
                                      .dx -
                                  56 / 2,
                        ),
                        height: 3,
                        width: (controller.index == 0) ? 36 : 56,
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
                                            SizedBox(
                                              height: 6,
                                            ),
                                            Text(
                                              'Local',
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1,
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
                                            SizedBox(
                                              height: 6,
                                            ),
                                            Text(
                                              'Local',
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline2,
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
                                            SizedBox(
                                              height: 6,
                                            ),
                                            Text(
                                              'National',
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1,
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
                                            SizedBox(
                                              height: 6,
                                            ),
                                            Text(
                                              'National',
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline2,
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
                    /// here is the local post page
                    FutureBuilder(
                        future: makeGetRequestFeedIdeas("regional"),
                        builder: (context, snapshot) {
                          return snapshot.data != null
                              ? Container(
                                  child: ListView.builder(
                                      itemCount: snapshot.data.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: (Container(
                                            child: ProblemStatelessWidget(
                                              title: 
                                                  snapshot.data[index].title,
                                              description:
                                                  snapshot.data[index].content,
                                              solution:
                                                  snapshot.data[index].solution,
                                              type: "Problem",
                                            ),
                                          )),
                                        );
                                      }),
                                )
                              : Center(child: CircularProgressIndicator());
                        }),
                    FutureBuilder(
                        future: makeGetRequestFeedIdeas("national"),
                        builder: (context, snapshot) {
                          return snapshot.data != null
                              ? Container(
                                  child: ListView.builder(
                                      itemCount: snapshot.data.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: (Container(
                                            child: ProblemStatelessWidget(
                                              title: snapshot.data[index].title,
                                              description:
                                                  snapshot.data[index].content,
                                              solution:
                                                  snapshot.data[index].solution,
                                              type: "Problem",
                                            ),
                                          )),
                                        );
                                      }),
                                )
                              : Center(child: CircularProgressIndicator());
                        }),
                  ],
                ),
              ),
            ],
          ),

          /// this is a gradient
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                ThemeColors.background.withOpacity(0.0),
                ThemeColors.background.withOpacity(0.67),
                ThemeColors.background,
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            ),
          ),

          /// this is the main button
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.all(16),
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ThemeColors.mainGreen,
                  boxShadow: [
                    BoxShadow(
                        color: ThemeColors.mainGreen,
                        offset: Offset(0, 8),
                        blurRadius: 16,
                        spreadRadius: -12)
                  ]),
              child: FloatingActionButton(
                backgroundColor: ThemeColors.mainGreen,
                onPressed: () async {
                  Navigator.of(context).pushNamed("/AddProposition");
                },
                child: Icon(Icons.edit),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
