import 'package:flutter/material.dart';
import 'package:wassil/controllers/feedController.dart';
import 'package:wassil/models/postModel.dart';
import 'package:wassil/models/postNews.dart';
import 'package:wassil/models/postPoll.dart';
import 'package:wassil/models/postProject.dart';
import 'package:wassil/ui/homePage/homeScreen.dart';
import 'package:wassil/ui/homePage/drawerScreen.dart';
import 'package:wassil/ui/proposition/addPropositionScreen.dart';
import 'package:wassil/ui/proposition/imagepick.dart';
import 'models/post.dart';

List<PostModel> listPostRegional;
List<PostModel> listPostNational;
fetchPost() async {
  listPostNational = await makeGetRequestFeed("national");
  listPostRegional = await makeGetRequestFeed("regional");
  listPostRegional.forEach((element) {
    element.post_type == "survey"
        ? Post.localPosts.add(Poll(
            element.title,
            element.ministryName,
            element.title,
          ))
        : element.post_type == "project"
            ? Post.localPosts.add(
                Project(element.title, element.townName, element.description, [
                "assets/img/projet1.jpg",
                "assets/img/projet2.jpg",
                "assets/img/projet3.jpg",
                "assets/img/projet4.jpg",
              ]))
            : Post.localPosts.add(News(element.title, element.ministryName,
                element.description, ["assets/img/news1.jpg"]));
  });
  listPostNational.forEach((element) {
    element.post_type == "survey"
        ? Post.nationalPosts.add(Poll(
            element.title,
            element.ministryName,
            element.title,
          ))
        : element.post_type == "project"
            ? Post.nationalPosts.add(
                Project(element.title, element.townName, element.description, [
                "assets/img/projet1.jpg",
                "assets/img/projet2.jpg",
                "assets/img/projet3.jpg",
                "assets/img/projet4.jpg",
              ]))
            : Post.nationalPosts.add(News(element.title, element.ministryName,
                element.description, ["assets/img/news1.jpg"]));
  });
}

void main() async {
  await fetchPost();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        textTheme: TextTheme(
          headline1: TextStyle(
              color: ThemeColors.textColor1,
              fontFamily: 'Montserrat',
              fontSize: 14,
              fontWeight: FontWeight.w500),
          headline2: TextStyle(
              color: ThemeColors.textColor2,
              fontFamily: 'Montserrat',
              fontSize: 14,
              fontWeight: FontWeight.w500),
          headline3: TextStyle(
              color: ThemeColors.textColor3,
              fontFamily: 'Montserrat',
              fontSize: 14,
              fontWeight: FontWeight.w500),
          headline4: TextStyle(
              color: ThemeColors.textColor2,
              fontFamily: 'Montserrat',
              fontSize: 12,
              fontWeight: FontWeight.w500),
          headline5: TextStyle(
              color: ThemeColors.textColor3,
              fontFamily: 'Montserrat',
              fontSize: 12,
              fontWeight: FontWeight.w500),
          bodyText1: TextStyle(
              color: ThemeColors.textColor2,
              fontFamily: 'Segoe UI',
              fontSize: 10,
              fontWeight: FontWeight.w400),
          bodyText2: TextStyle(
              color: ThemeColors.textColor1,
              fontFamily: 'Segoe UI',
              fontSize: 10,
              fontWeight: FontWeight.w600),
          button: TextStyle(
              color: ThemeColors.textColor1,
              fontFamily: 'Montserrat',
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
      ),
      routes: <String, WidgetBuilder>{
        "/AddProposition": (BuildContext context) => new AddPropositionScreen(),
      },
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final double slideMax = 225.0;
  bool _canBeDragged = false;
  AnimationController animationController;

  final double minDragStartEdge = 50;
  final double maxDragStartEdge = 50;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
  }

  void toggleDrawer() => animationController.isDismissed
      ? animationController.forward()
      : animationController.reverse();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.background,
      body: AnimatedBuilder(
        animation: animationController,
        builder: (context, _) {
          double slide = slideMax * animationController.value;
          double scale = 1 - animationController.value * 0.3;
          return GestureDetector(
            onHorizontalDragStart: _onDragStart,
            onHorizontalDragUpdate: _onDragUpdate,
            onHorizontalDragEnd: _onDragEnd,
            child: Stack(
              children: <Widget>[
                DrawerScreen(),
                Transform(
                    transform: Matrix4.identity()
                      ..translate(slide)
                      ..scale(scale),
                    alignment: Alignment.centerLeft,
                    child: HomeScreen(
                      toggle: toggleDrawer,
                    )),
              ],
            ),
          );
        },
      ),
    );
  }

  void _onDragStart(DragStartDetails details) {
    bool isDragOpenFormatLeft = animationController.isDismissed &&
        details.globalPosition.dx < minDragStartEdge;
    bool isDragCloseFormatRight = animationController.isCompleted &&
        details.globalPosition.dx > maxDragStartEdge;

    _canBeDragged = isDragOpenFormatLeft || isDragCloseFormatRight;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (_canBeDragged) {
      double delta = details.primaryDelta / slideMax;
      animationController.value += delta;
    }
  }

  void _onDragEnd(DragEndDetails details) {
    if (animationController.isDismissed || animationController.isCompleted) {
      return;
    }
    if (details.velocity.pixelsPerSecond.dx.abs() >= 365.0) {
      double visualVelocity = details.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;

      animationController.fling(velocity: visualVelocity);
    } else if (animationController.value < 0.5) {
      animationController.reverse();
    } else {
      animationController.forward();
    }
  }
}

// Colors
class ThemeColors {
  static bool nightMode = false;
  static Color mainGreen = Color(0xff3CB979);
  static Color backgroundDark = Color(0xff0E1317);
  static Color background = Color(0xff161D24);
  static Color backgroundLight = Color(0xff44484F);
  static Color backgroundLighter = Color(0xff63676f);
  static Color textColor1 = Color(0xffffffff);
  static Color textColor2 = Color(0xffC4CED8);
  static Color textColor3 = Color(0xff8E9BA7);

  static Color purple = Color(0xff8C52B9);
  static Color amber = Color(0xffFBAF5D);
  static Color red = Color(0xffF0504C);

  static void changeColorMode() {
    if (ThemeColors.nightMode == false) {
      ThemeColors.nightMode = true;
      ThemeColors.backgroundDark = Color(0xff0E1317);
      ThemeColors.background = Color(0xff161D24);
      ThemeColors.backgroundLight = Color(0xff44484F);
      ThemeColors.backgroundLighter = Color(0xff63676f);
      ThemeColors.textColor1 = Color(0xffffffff);
      ThemeColors.textColor2 = Color(0xffC4CED8);
      ThemeColors.textColor3 = Color(0xff8E9BA7);
      return;
    } else {
      ThemeColors.nightMode = false;
      ThemeColors.backgroundDark = Color(0xffffffff);
      ThemeColors.background = Color(0xffC4CED8);
      ThemeColors.backgroundLight = Color(0xff3CB979);
      ThemeColors.backgroundLighter = Color(0xff8E9BA7);
      ThemeColors.textColor1 = Color(0xff0E1317);
      ThemeColors.textColor2 = Color(0xff161D24);
      ThemeColors.textColor3 = Color(0xff44484F);
      return;
    }
  }
}
