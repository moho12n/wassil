import 'dart:io';

import 'package:http/http.dart';
import 'dart:convert';
import '../models/postModel.dart';
import '../tools/tools.dart';

Map<String, String> headers = {
  HttpHeaders.contentTypeHeader: "application/json", // or whatever
  HttpHeaders.authorizationHeader:
      "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIyMSIsImp0aSI6IjU0YzU2NzU3OWQ0MDY0MjdjMGUzZDZjOWFkZGJlNTVhM2RkNmY1OWRjN2Q5NmM4MzBmYzc5ZTRjNDk1YzNkOGIyNzg2ZDEzZGYxYWY3NjFlIiwiaWF0IjoxNTkzNzIyMDAyLCJuYmYiOjE1OTM3MjIwMDIsImV4cCI6MTYyNTI1ODAwMiwic3ViIjoiMSIsInNjb3BlcyI6W119.CE3JDV7tqntR2iugyR-84yrvpjzM952mc1AOfukL1ojSeiKBcOE_FVaBug1Oh7ggAofJv0dJwbrsVS2mNEKxFHk-SVcmBJeHAKw4KiqfCG400pqkIt-rZvYNx2CQpoPjroKLpYgyFwnFegZf1OgJIIUIPEJBfzwmYJgwKrfZncGNomkdCbHrz927KnTpkW7UZ9hLin0WCylFXnM9aqUxlELSyppYUcSpNx5wtKsc-lJf3ACerOI6gBzviJd5TnyWeWItNiv76Uonovjby8lVtD8IJ2Wi-xGkR_tuZQ-n-lyMfyjHSniMEThvzZLJsL01eDQTpBW8Z4JNMBQHy7Qm3QZBzLGjoEwfLyEm7A-M5rliEjEl2ImxNwiLYaJVN6ZLG4NAWN-eiPNMN09P6CIHKxg7sfbzs4qbzURJ64AaBstjpY4zwqxLnxzFHmlbqm7U4DAtjz-GY2xfCoSV7_fQtvWsMWVYRlrdIFzAwPfomVMmULK1v85a59qkUEUJrjPHBA0MrQ08onL-FrwWvoAnvn72Xm-1-aN2RVBPRY-oo6qc0egvLxjV4dJZqExDYMxDk-I-ySXdL1XK9A1mKvaTKz3MGQHj68QbH8odyTt3IHEaXnWIun_EOvM4jcxssYCCw2t8S_YRiE7cnf8xnk8AhHP38_I76iVK4D-hldBrn3E",
  HttpHeaders.acceptHeader: "application/json",
};
Future<Response> makePostComment(
  String comment,
  String projectId,
) async {
  String json = '{"project_id":$projectId,"content":"$comment"}';
  Response response =
      await post(Tools.domainName + "comments", body: json, headers: headers);
  print(response.body);
  return response;
}
