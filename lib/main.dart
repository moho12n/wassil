import 'package:flutter/material.dart';
import 'package:wassil/ui/homePage/sliver.dart';
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
      ),
      home: HomePage(),
    );
  }
}

// Colors
class ThemeColors {
  static const Color mainGreen = Color(0xff3CB979);
  static const Color background = Color(0xff161D24);
  static const Color backgroundLighter = Color(0xff44484F);
  static const Color textColor1 = Color(0xffffffff);
  static const Color textColor2 = Color(0xffC4CED8);
  static const Color textColor3 = Color(0xff8E9BA7);
}