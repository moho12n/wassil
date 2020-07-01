import 'package:flutter/material.dart';
import 'package:wassil/main.dart';
import 'PostWidget.dart';
import 'package:wassil/models/post.dart';
import 'package:wassil/models/postNews.dart';
import 'package:wassil/models/postPoll.dart';
import 'package:wassil/models/postProject.dart';
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
    controller = TabController(length: 2, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // todo: take care of this later
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: ThemeColors.mainGreen),
          child: SvgPicture.asset(
            "assets/Groupe 12.svg",
            width: 37,
            height: 37,
          ),
        ),
      ),
      backgroundColor: ThemeColors.background,
      body: SafeArea(
          child: Stack(
            alignment: Alignment.bottomCenter,
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
                    Wrap(
                      direction: Axis.horizontal,
                      children: _buildPosts(Post.localPosts),
                    ),

                    /// here is the national post page
                    Wrap(
                      direction: Axis.horizontal,
                      children: _buildPosts(Post.nationalPosts),
                    ),
                  ],
                ),
              ),
            ],
          ),

          /// this is a gradient
          Container(
            height: 80,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
              ThemeColors.background.withOpacity(0.0),
              ThemeColors.background,
            ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
          )
        ],
      )),
    );
  }

  List<Widget> _buildPosts(List<Post> list) {
    List<Widget> _returnList = [];
    for (int i = 0; i < list.length; i++) {
      if (list[i] is News) {
        _returnList.add(NewsWidget(
          news: list[i],
        ));
      } else if (list[i] is Poll) {
        _returnList.add(PollWidget(
          poll: list[i],
        ));
      } else if (list[i] is Project) {
        _returnList.add(ProjectWidget(
          project: list[i],
        ));
      }
    }
    return _returnList;
  }
}
