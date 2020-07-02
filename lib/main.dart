import 'package:flutter/material.dart';
import 'package:wassil/ui/homePage/homeScreen.dart';
import 'package:wassil/ui/homePage/drawerScreen.dart';
import 'package:wassil/ui/proposition/addPropositionScreen.dart';
import 'package:wassil/ui/proposition/imagepick.dart';

void main() => runApp(
      MyApp(),
    );

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
          ),),
      routes: <String, WidgetBuilder>{
    "/AddProposition": (BuildContext context) => new AddPropositionScreen(),},
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
  static const Color mainGreen = Color(0xff3CB979);
  static const Color backgroundDark = Color(0xff0E1317);
  static const Color background = Color(0xff161D24);
  static const Color backgroundLight = Color(0xff44484F);
  static const Color backgroundLighter = Color(0xff63676f);
  static const Color textColor1 = Color(0xffffffff);
  static const Color textColor2 = Color(0xffC4CED8);
  static const Color textColor3 = Color(0xff8E9BA7);

  static const Color purple = Color(0xff8C52B9);
  static const Color amber = Color(0xffFBAF5D);
  static const Color red = Color(0xffF0504C);
}
