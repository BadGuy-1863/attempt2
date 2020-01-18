import 'package:shared_preferences/shared_preferences.dart';

class PrefManager{
  setLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', true);
  }
  setLogout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', false);
  }
  checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool log = prefs.getBool('isLoggedIn');
    return log;
  }
}