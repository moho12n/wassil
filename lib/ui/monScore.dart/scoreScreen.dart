import 'package:flutter/material.dart';
import 'package:wassil/main.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';

class ScoreScreen extends StatefulWidget {
  final VoidCallback toggle;

  const ScoreScreen({
    this.toggle,
    Key key,
  }) : super(key: key);

  @override
  _ScoreScreenState createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      backgroundColor: ThemeColors.backgroundDark,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 48.0, left: 12),
              child: GestureDetector(
                onTap: widget.toggle,
                child: SvgPicture.asset(
                  'assets/left_menu.svg',
                  height: 28,
                  width: 28,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 48.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 96,
                      width: 96,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("assets/img/pdp.jpg"),
                              fit: BoxFit.fill)),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "DOUZANE Mohamed",
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text("My User ID: 10964006",
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.bodyText1),
                    SizedBox(
                      height: 64,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "⭐    Score :  ",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: ThemeColors.textColor1,
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            Random().nextInt(400).toString(),
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: ThemeColors.textColor2,
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 32.0, top: 64),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "🚨    Problèmes signalés :  ",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: ThemeColors.textColor1,
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            Random().nextInt(5).toString(),
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: ThemeColors.textColor2,
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 32.0, top: 48),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "💡    Idées proposées :  ",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: ThemeColors.textColor1,
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            Random().nextInt(3).toString(),
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: ThemeColors.textColor2,
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 32.0, top: 48),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "👍    Interactions :  ",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: ThemeColors.textColor1,
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            Random().nextInt(60).toString(),
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: ThemeColors.textColor2,
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 32.0, top: 48),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "💬    Commentaires :  ",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: ThemeColors.textColor1,
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            Random().nextInt(10).toString(),
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: ThemeColors.textColor2,
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
