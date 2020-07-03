import 'package:flutter/material.dart';
import 'package:wassil/main.dart';

import 'package:flutter_svg/flutter_svg.dart';

String comment = "";

class Dimens {
  static double Width;
  static double Height;
}

void avisPopup(BuildContext context) {
  Dimens.Height = MediaQuery.of(context).size.height;
  Dimens.Width = MediaQuery.of(context).size.width;

  bool _validate = false;
  showDialog(
      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Stack(
            children: <Widget>[
              Container(
                width: Dimens.Width,
                height: Dimens.Height,
                decoration: BoxDecoration(
                    color: ThemeColors.backgroundDark.withOpacity(0.30)),
                child: GestureDetector(
                  onTap: () => print(''),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        color: Colors.white,
                        width: Dimens.Width * .9,
                        height: Dimens.Height * .45,
                        child: Material(
                          textStyle: TextStyle(color: Colors.black),
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: InkWell(
                                      onTap: () => Navigator.pop(context),
                                      child: Icon(
                                        Icons.clear,
                                        color: Colors.grey,
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: SizedBox(
                                    width: Dimens.Width,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 0),
                                          child: Center(
                                            child: RichText(
                                                maxLines: 5,
                                                textAlign: TextAlign.center,
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                      text:
                                                          "Laissez votre commentaire",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "Montserrat",
                                                        fontSize: 18,
                                                        color:
                                                            Color(0xff000000),
                                                      )),
                                                ])),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: Dimens.Height * .05),
                                          child: new Container(
                                            height: Dimens.Height * .20,
                                            width: Dimens.Width * .8,
                                            decoration: BoxDecoration(
                                              color: Color(0xff707070)
                                                  .withOpacity(0.05),
                                              borderRadius:
                                                  BorderRadius.circular(5.00),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0, right: 8.0),
                                              child: TextField(
                                                keyboardType:
                                                    TextInputType.multiline,
                                                maxLines: null,
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontFamily: 'Montserrat',
                                                    color: Colors.black87),
                                                cursorColor: Color(0xff5acfc3),
                                                decoration: InputDecoration(
                                                  errorText: _validate
                                                      ? "Le champs Avis ne doit pas être vide"
                                                      : null,
                                                  border: InputBorder.none,
                                                  hintText: "Votre commentaire",
                                                  hintStyle: TextStyle(
                                                    fontFamily: "Montserrat",
                                                    fontSize: 17,
                                                    color: Color(0xff707070)
                                                        .withOpacity(0.50),
                                                  ),
                                                  //  hintStyle: Theme.of(context).textTheme.display2,
                                                ),
                                                onChanged: (input) {
                                                  comment = input;
                                                  print("comment = " + comment);
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: Dimens.Height * .01),
                                            child: Container(
                                              height: Dimens.Height * .1,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Row(
                                                children: <Widget>[
                                                  SizedBox(
                                                    width: 21,
                                                  ),
                                                  InkWell(
                                                    onTap: () async {},
                                                    child: Container(
                                                      height: 37.00,
                                                      width: 56.00,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5.0),
                                                        child: SvgPicture.asset(
                                                          "assets/image.svg",
                                                          alignment:
                                                              Alignment.center,
                                                          color:
                                                              Color(0xff707070),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 21,
                                                  ),
                                                  Expanded(
                                                    child: InkWell(
                                                        onTap: () {},
                                                        child: new Container(
                                                          height: 36.00,
                                                          width:
                                                              Dimens.Width * .3,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: ThemeColors
                                                                .mainGreen,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                offset: Offset(
                                                                    0.00, 5.00),
                                                                color: ThemeColors
                                                                    .mainGreen
                                                                    .withOpacity(
                                                                        0.32),
                                                                blurRadius: 5,
                                                              ),
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50.00),
                                                          ),
                                                          child: Center(
                                                            child: new Text(
                                                              "Soumettre",
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    "Montserrat",
                                                                fontSize: 18,
                                                                color: Color(
                                                                    0xffffffff),
                                                              ),
                                                            ),
                                                          ),
                                                        )),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: Dimens.Height * .045,
                left: Dimens.Width * .38,
                child: new Container(
                  height: 99.00,
                  width: 99.00,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        );
      });
}
