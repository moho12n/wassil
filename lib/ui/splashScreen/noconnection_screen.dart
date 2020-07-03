import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../main.dart';
import 'dart:ui' as ui;
/*
int indexMarker;

class NoConnectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/NoConnection.png"),
            SizedBox(height: 43),
            new Text(
              "No way !\n",
              style: TextStyle(
                fontFamily: "Gotham",
                fontSize: 20,
                color: Color(0xff393939),
              ),
            ),
            new Text(
              "Vous devez activer votre internet d'abord,\navant d'utiliser l'application",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Gotham",
                fontWeight: FontWeight.w300,
                fontSize: 14,
                color: Color(0xff434343),
              ),
            ),
            SizedBox(height: 50),
            InkWell(
              child: new Container(
                height: 42.00,
                width: 144.00,
                decoration: BoxDecoration(
                  color: Color(0xff5acfc3),
                  borderRadius: BorderRadius.circular(21.00),
                ),
                child: Center(
                  child: new Text(
                    "Réessayer",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Gotham",
                      fontSize: 18,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
              onTap: () async {
                try {
                  /*final result = await InternetAddress.lookup('google.com');
                  if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
                    if (UserOnline.userIsOnline)
                      await makeGetUserInformation(UserOnline.token);
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        UserOnline.userIsOnline
                            ? '/HomePage'
                            : '/WelcomeScreen1',
                        (Route<dynamic> route) => false);
                  */}
                } on SocketException catch (_) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NoConnectionScreen()));
                }
              },
            )
          ],
        ),
      ),
    );
  }

  makeGetUserInformation(String token) {}
}
*/