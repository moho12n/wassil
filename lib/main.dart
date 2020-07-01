import 'package:flutter/material.dart';
import 'package:wassil/ui/homePage/homePage.dart';
import 'package:wassil/ui/proposition/addPropositionScreen.dart';
//import 'package:wassil/ui/homePage/homePage.dart';

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
                color: ThemeColors.textColor1, fontFamily: 'Montserrat', fontSize: 14, fontWeight: FontWeight.w500),
            headline2: TextStyle(
                color: ThemeColors.textColor2, fontFamily: 'Montserrat', fontSize: 14, fontWeight: FontWeight.w500),
            headline3: TextStyle(
                color: ThemeColors.textColor3, fontFamily: 'Montserrat', fontSize: 14, fontWeight: FontWeight.w500),
            headline4: TextStyle(
                color: ThemeColors.textColor2, fontFamily: 'Montserrat', fontSize: 12, fontWeight: FontWeight.w500),
            headline5: TextStyle(
                color: ThemeColors.textColor3, fontFamily: 'Montserrat', fontSize: 12, fontWeight: FontWeight.w500),
            bodyText1: TextStyle(
                color: ThemeColors.textColor2, fontFamily: 'Segoe UI', fontSize: 10, fontWeight: FontWeight.w400),
            bodyText2: TextStyle(
                color: ThemeColors.textColor1, fontFamily: 'Segoe UI', fontSize: 10, fontWeight: FontWeight.w600),
            button: TextStyle(
                color: ThemeColors.textColor1, fontFamily: 'Montserrat', fontSize: 16, fontWeight: FontWeight.w500),
          )
      ),
      home: HomePage(),
    );
  }
}

// Colors
class ThemeColors {
  static const Color mainGreen = Color(0xff3CB979);
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