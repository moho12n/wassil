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
                    color: ThemeColors.backgroundLight,
                    width: Dimens.Width * .9,
                    child: Material(
                      textStyle: TextStyle(color: Colors.black),
                      color: ThemeColors.backgroundLight,
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
                                              text: "Envoyé !\n",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1),
                                          WidgetSpan(
                                              child: Container(
                                            height: 10.0,
                                          )),
                                          TextSpan(
                                              text: success.toUpperCase() +
                                                  "\n\n",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1),
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
                      color: ThemeColors.backgroundLight,
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
                                              text: "Erreur !\n",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1),
                                          WidgetSpan(
                                              child: Container(
                                            height: 10.0,
                                          )),
                                          TextSpan(
                                              text: error + "\n\n",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline2),
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
