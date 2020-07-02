import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';

class UserOnline {
  static User user;
  static bool userIsOnline;
  static String token;
}

Future saveUser() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt("id", UserOnline.user.id);

  await prefs.setString("firstName", UserOnline.user.firstName);
  await prefs.setString("lastName", UserOnline.user.lastName);
  await prefs.setString("email", UserOnline.user.email);
  await prefs.setString("phone", UserOnline.user.phone);
  await prefs.setString("role", UserOnline.user.role);
  await prefs.setString("password", UserOnline.user.password);
  await prefs.setString("rememberToken", UserOnline.user.rememberToken);
  await prefs.setString("rememberToken", UserOnline.user.townId.toString());

  await prefs.setBool("userIsOnline", UserOnline.userIsOnline);
  await prefs.setString("token", UserOnline.token);
}

Future getUser() async {
  final prefs = await SharedPreferences.getInstance();
  UserOnline.user.id = await prefs.getInt("id") ?? "-1";

  UserOnline.user.firstName = await prefs.getString("firstName") ?? "none";
  UserOnline.user.lastName = await prefs.getString("lastName") ?? "none";
  UserOnline.user.email = await prefs.getString("email") ?? "none";
  UserOnline.user.phone = await prefs.getString("phone") ?? "none";
  UserOnline.user.role = await prefs.getString("role") ?? "none";
  UserOnline.user.password = await prefs.getString("password") ?? "none";
  UserOnline.user.rememberToken =
      await prefs.getString("rememberToken") ?? "none";

  UserOnline.userIsOnline = await prefs.getBool("userIsOnline") ?? false;

  UserOnline.token = await prefs.getString("token") ?? "";
}

Future deleteUser() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.clear();
  UserOnline.token = "";
  UserOnline.userIsOnline = false;
  UserOnline.user = User();

  await prefs.setBool("userIsOnline", UserOnline.userIsOnline);
}
