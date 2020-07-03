import 'package:flutter/material.dart';
import 'package:wassil/main.dart';
import 'package:wassil/ui/feedCitoyen/feedCitoyenIdeas.dart';
import 'PostWidget.dart';
import 'package:wassil/models/post.dart';
import 'package:wassil/models/postNews.dart';
import 'package:wassil/models/postPoll.dart';
import 'package:wassil/models/postProject.dart';

import 'package:flutter_svg/flutter_svg.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          width: 225,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 44,
              ),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Column(
                    children: <Widget>[
                      ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: <Widget>[
                              Image(
                                  width: 64,
                                  image: AssetImage('assets/img/pdp.jpg')),
                              Container(
                                height: 24,
                                width: 64,
                                color: Colors.black.withOpacity(0.3),
                                child: Center(
                                    child: Text(
                                  "Changer",
                                  style: Theme.of(context).textTheme.bodyText2,
                                  textScaleFactor: 0.8,
                                )),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Nom du citoyen",
                            textAlign: TextAlign.left,
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text("My User ID: 10964006",
                              textAlign: TextAlign.left,
                              style: Theme.of(context).textTheme.bodyText1),
                        ],
                      ),
                    ],
                  )),
              SizedBox(
                height: 16,
              ),
              FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  splashColor: ThemeColors.backgroundLighter,
                  highlightColor: ThemeColors.backgroundLighter,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  disabledColor: Colors.grey[350],
                  disabledTextColor: Colors.grey[500],
                  onPressed: () {},
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: ThemeColors.mainGreen.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(100)),
                        child: Icon(
                          Icons.edit,
                          size: 20,
                          color: ThemeColors.mainGreen,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        "Modifier le profil",
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Spacer(),
                      Icon(
                        Icons.keyboard_arrow_right,
                        size: 24,
                        color: ThemeColors.textColor2,
                      ),
                    ],
                  )),
              Divider(
                height: 0,
                color: ThemeColors.textColor2.withOpacity(0.3),
                indent: 64,
              ),
              FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  splashColor: ThemeColors.backgroundLighter,
                  highlightColor: ThemeColors.backgroundLighter,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  disabledColor: Colors.grey[350],
                  disabledTextColor: Colors.grey[500],
                  onPressed: () {},
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(100)),
                        child: Icon(
                          Icons.contact_mail,
                          size: 20,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Mon score",
                            textAlign: TextAlign.left,
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.keyboard_arrow_right,
                        size: 24,
                        color: ThemeColors.textColor2,
                      ),
                    ],
                  )),
              Divider(
                  height: 0, color: ThemeColors.textColor2.withOpacity(0.3)),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, top: 16, bottom: 8, right: 16),
                child: Text(
                  "Publications",
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  splashColor: ThemeColors.backgroundLighter,
                  highlightColor: ThemeColors.backgroundLighter,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  disabledColor: Colors.grey[350],
                  disabledTextColor: Colors.grey[500],
                  onPressed: () {
                    setState(() {});
                  },
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(100)),
                        child: SvgPicture.asset(
                          "assets/government.svg",
                          height: 24,
                          color: Colors.green.withOpacity(0.9),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        "Gouvernement",
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ],
                  )),
              Divider(
                height: 0,
                color: ThemeColors.textColor2.withOpacity(0.3),
                indent: 64,
              ),
              FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  splashColor: ThemeColors.backgroundLighter,
                  highlightColor: ThemeColors.backgroundLighter,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  disabledColor: Colors.grey[350],
                  disabledTextColor: Colors.grey[500],
                  onPressed: () {
                    setState(() {
                      /*
                      Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FeedCitoyenIdeas(toggle: toggleDrawer,)));*/
                    });
                  },
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(100)),
                        child: SvgPicture.asset(
                          "assets/emergency.svg",
                          height: 24,
                          color: Colors.red.withOpacity(0.9),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        "Problèmes signalés",
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ],
                  )),
              Divider(
                height: 0,
                color: ThemeColors.textColor2.withOpacity(0.3),
                indent: 64,
              ),
              FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  splashColor: ThemeColors.backgroundLighter,
                  highlightColor: ThemeColors.backgroundLighter,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  disabledColor: Colors.grey[350],
                  disabledTextColor: Colors.grey[500],
                  onPressed: () {},
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: Colors.amber.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(100)),
                        child: SvgPicture.asset(
                          "assets/idea.svg",
                          height: 24,
                          color: Colors.amber,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        "Propositions d'idées",
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ],
                  )),
              Divider(
                  height: 0, color: ThemeColors.textColor2.withOpacity(0.3)),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, top: 16, bottom: 8, right: 16),
                child: Text(
                  "Paramètres",
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  splashColor: ThemeColors.backgroundLighter,
                  highlightColor: ThemeColors.backgroundLighter,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  disabledColor: Colors.grey[350],
                  disabledTextColor: Colors.grey[500],
                  onPressed: () {
                    setState(() {
                      ThemeColors.changeColorMode();
                    });
                  },
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: ThemeColors.textColor1.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(100)),
                        child: Icon(
                          Icons.brightness_medium,
                          size: 24,
                          color: ThemeColors.textColor1.withOpacity(0.7),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        "Apparence",
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ],
                  )),
              Divider(
                height: 0,
                color: ThemeColors.textColor2.withOpacity(0.3),
                indent: 64,
              ),
              FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  splashColor: ThemeColors.backgroundLighter,
                  highlightColor: ThemeColors.backgroundLighter,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  disabledColor: Colors.grey[350],
                  disabledTextColor: Colors.grey[500],
                  onPressed: () {},
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: Colors.amber.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(100)),
                        child: Icon(
                          Icons.language,
                          size: 24,
                          color: Colors.amber,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        "Langue",
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Spacer(),
                      Icon(
                        Icons.keyboard_arrow_right,
                        size: 24,
                        color: ThemeColors.textColor2,
                      ),
                    ],
                  )),
              Divider(
                  height: 0, color: ThemeColors.textColor2.withOpacity(0.3)),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, top: 16, bottom: 8, right: 16),
                child: Text(
                  "Autre",
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  splashColor: ThemeColors.backgroundLighter,
                  highlightColor: ThemeColors.backgroundLighter,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  disabledColor: Colors.grey[350],
                  disabledTextColor: Colors.grey[500],
                  onPressed: () {},
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: Colors.cyan.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(100)),
                        child: Icon(
                          Icons.live_help,
                          size: 20,
                          color: Colors.cyan,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Flexible(
                        child: Text(
                          "Contacter le support",
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        size: 24,
                        color: ThemeColors.textColor2,
                      ),
                    ],
                  )),
              FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  splashColor: ThemeColors.backgroundLighter,
                  highlightColor: ThemeColors.backgroundLighter,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  disabledColor: Colors.grey[350],
                  disabledTextColor: Colors.grey[500],
                  onPressed: () {},
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: Colors.purpleAccent.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(100)),
                        child: Icon(
                          Icons.favorite,
                          size: 20,
                          color: Colors.purpleAccent,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Flexible(
                        child: Text(
                          "Envoyer des commentaires",
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.headline4,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        size: 24,
                        color: ThemeColors.textColor2,
                      ),
                    ],
                  )),
              FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  splashColor: ThemeColors.backgroundLighter,
                  highlightColor: ThemeColors.backgroundLighter,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  disabledColor: Colors.grey[350],
                  disabledTextColor: Colors.grey[500],
                  onPressed: () {},
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(6),
                        height: 32,
                        decoration: BoxDecoration(
                            color: ThemeColors.backgroundLight,
                            borderRadius: BorderRadius.circular(100)),
                        child: Image(
                            width: 20, image: AssetImage("assets/Logo.png")),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Flexible(
                        child: RichText(
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.fade,
                          text: TextSpan(children: [
                            TextSpan(
                              text: "À propos de ",
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            TextSpan(
                              text: "LightDev ⚡",
                              style: Theme.of(context).textTheme.headline2,
                            )
                          ]),
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        size: 24,
                        color: ThemeColors.textColor2,
                      ),
                    ],
                  )),
              Divider(
                  height: 1, color: ThemeColors.textColor2.withOpacity(0.3)),
              SizedBox(
                height: 8,
              ),
              FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  splashColor: ThemeColors.backgroundLighter,
                  highlightColor: ThemeColors.backgroundLighter,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  disabledColor: Colors.grey[350],
                  disabledTextColor: Colors.grey[500],
                  onPressed: () {
                    Navigator.of(context).pushNamed('/');
                  },
                  child: Row(
                    children: <Widget>[
                      Spacer(),
                      Text(
                        "Se déconnecte",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.red,
                            fontFamily: 'Montserrat',
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      Spacer(),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
