import 'package:http/http.dart';
import '../state/userState.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'dart:convert';

import '../tools/tools.dart';

Map<String, String> headers = {
  HttpHeaders.contentTypeHeader: "application/json",
  HttpHeaders.acceptHeader: "application/json",
};

Future<String> makePostLoginRequest(String email, String password) async {
  var returnMessage = "";
  UserOnline.userIsOnline = false;
  String url = Tools.domainName + 'login';
  String json = '{"email": "$email", "password" : "$password"}';
  print("json of login " + json);

  Response response = await post(url, body: json, headers: headers);
  // check the status code for the result
  int statusCode = response.statusCode;
  // this API passes back the updated item with the id added
  String body = response.body;

  print("status code =" + statusCode.toString() + "body: " + body);
  if (statusCode == 200) {
    var data = jsonDecode(response.body);
    var rest = data["data"] as Map<String, dynamic>;
    if (rest != null) {
      UserOnline.token = rest["token"];
      UserOnline.userIsOnline = true;
      returnMessage = "success";
    } else {
      returnMessage = "Error: user and password doesn’t match";
    }
  } else {
    returnMessage = "Error: user doesn't exist";
  }
  return returnMessage;
}
