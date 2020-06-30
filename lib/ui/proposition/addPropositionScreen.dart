import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:getflutter/getflutter.dart';

class AddPropositionScreen extends StatefulWidget {
  @override
  _AddPropositionScreenState createState() => _AddPropositionScreenState();
}

class _AddPropositionScreenState extends State<AddPropositionScreen> {
  String title;
  String contenu;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xff161D24),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: new Container(
              height: 70.00,
              width: MediaQuery.of(context).size.width,
              color: Color(0xff44484f),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 24,
                  ),
                  SvgPicture.asset("assets/arrow-left (1).svg", width: 19),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "Exprimez-vous",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Color(0xffffffff),
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
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 23.0),
              child: new Container(
                height: 52.00,
                width: MediaQuery.of(context).size.width - 48,
                decoration: BoxDecoration(
                  color: Color(0xff3cb979),
                  borderRadius: BorderRadius.circular(82.00),
                ),
                child: Center(
                  child: new Text(
                    "ENVOYER",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80.0, bottom: 80),
            child: SingleChildScrollView(
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 14,
                        ),
                        Center(
                          child: ToggleSwitch(
                            cornerRadius: 63,
                            minWidth: 90.0,
                            initialLabelIndex: 2,
                            activeBgColor: Color(0xff3cb979),
                            activeTextColor: Colors.white,
                            inactiveBgColor: Color(0xff0e1317),
                            inactiveTextColor: Colors.white,
                            labels: ['idee', 'Probleme'],
                            onToggle: (index) {
                              print('switched to: $index');
                            },
                          ),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Divider(
                          color: Color(0xff44484F),
                          thickness: 2,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text(
                            "Titre",
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Center(
                          child: Container(
                            height: 51.00,
                            width: MediaQuery.of(context).size.width - 24,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xff44484F)),
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10.00),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: TextField(
                                keyboardType: TextInputType.text,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Montserrat',
                                    color: Colors.white),
                                cursorColor: Color(0xff5acfc3),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "",
                                  hintStyle: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 17,
                                    color: Color(0xff707070).withOpacity(0.50),
                                  ),
                                ),
                                onChanged: (input) {
                                  setState(() {
                                    title = input;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Divider(
                          color: Color(0xff44484F),
                          thickness: 2,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text(
                            "Contenu",
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Center(
                          child: Container(
                            height: 180.00,
                            width: MediaQuery.of(context).size.width - 24,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xff44484F)),
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10.00),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: TextField(
                                maxLines: 10,
                                keyboardType: TextInputType.text,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Montserrat',
                                    color: Colors.white),
                                cursorColor: Color(0xff5acfc3),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "",
                                  hintStyle: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 17,
                                    color: Color(0xff707070).withOpacity(0.50),
                                  ),
                                ),
                                onChanged: (input) {
                                  setState(() {
                                    title = input;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Divider(
                          color: Color(0xff44484F),
                          thickness: 2,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text(
                            "Ajouter des photos",
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Center(
                          child: Container(
                            height: 51.00,
                            width: MediaQuery.of(context).size.width - 24,
                            decoration: BoxDecoration(
                              color: Color(0xff0e1317),
                              border: Border.all(
                                width: 2.00,
                                color: Color(0xff44484f),
                              ),
                              borderRadius: BorderRadius.circular(12.00),
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                "assets/Show more.svg",
                                width: 32,
                                height: 32,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 80,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
