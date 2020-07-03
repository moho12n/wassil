import 'package:flutter/material.dart';
import 'package:wassil/main.dart';

class Dimens {
  static double Width;
  static double Height;
}

void showSuccessDialog(BuildContext context, String success) {
  Dimens.Height = MediaQuery.of(context).size.height;
  Dimens.Width = MediaQuery.of(context).size.width;
  showDialog(
      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            width: Dimens.Width,
            height: Dimens.Height,
            decoration: BoxDecoration(
                color: ThemeColors.backgroundDark.withOpacity(.6)),
            child: GestureDetector(
              onTap: () => print(''),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    color: Colors.white,
                    width: Dimens.Width * .9,
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: SizedBox(
                                width: Dimens.Width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text: "Bravo !\n",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Gotham',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                          WidgetSpan(
                                              child: Container(
                                            height: 10.0,
                                          )),
                                          TextSpan(
                                              text: success.toUpperCase() +
                                                  "\n\n",
                                              style: TextStyle(
                                                  fontFamily: "Gotham",
                                                  color: ThemeColors.mainGreen,
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 12)),
                                        ])),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      });
}

void showErrorDialog(BuildContext context, String error) {
  Dimens.Height = MediaQuery.of(context).size.height;
  Dimens.Width = MediaQuery.of(context).size.width;
  showDialog(
      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            width: Dimens.Width,
            height: Dimens.Height,
            decoration: BoxDecoration(
                color: ThemeColors.backgroundDark.withOpacity(.6)),
            child: GestureDetector(
              onTap: () => print(''),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    color: Colors.white,
                    width: Dimens.Width * .9,
                    child: Material(
                      textStyle: TextStyle(color: Colors.black),
                      color: Colors.white.withOpacity(0.9),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: SizedBox(
                                width: Dimens.Width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text: "Oops!\n",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Gotham',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                          WidgetSpan(
                                              child: Container(
                                            height: 10.0,
                                          )),
                                          TextSpan(
                                              text: error + "\n\n",
                                              style: TextStyle(
                                                  fontFamily: "Gotham",
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 12)),
                                        ])),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      });
}
