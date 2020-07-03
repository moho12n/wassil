import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:wassil/main.dart';

import '../../tools/tools.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'noconnection_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _height, _width;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((_) async {
      /*Navigator.of(context)
          .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomePage()));*/
          Navigator.of(context).pushNamedAndRemoveUntil(
                '/HomePage' ,
                (Route<dynamic> route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xff44484F),
      body: Center(child: Image.asset("assets/Logo.png")),
    );
  }
}
