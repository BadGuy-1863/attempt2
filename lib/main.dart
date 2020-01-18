import 'package:attempt2/pages/home.dart';
import 'package:attempt2/pages/login.dart';
import 'package:attempt2/pages/register.dart';
import 'package:attempt2/utils/pref_manager.dart';
import 'package:flutter/material.dart';

final base = "128.61.62.85";
final url = "http://" + base + "/api/android/";
void main() async {
  //initialize values
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  final Widget default_home;

  const MyApp({Key key, this.default_home}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Attempt2',
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      home: _getLandingPage(),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => new LoginPage(url:"hi"),
        '/register': (BuildContext context) => new RegisterPage(url:"hello")
      },
    );

  }
}
Widget _getLandingPage(){
  //determine if logged in
  return FutureBuilder<Widget>
  //Widget _home = new HomePage(url: url);
  //PrefManager prefManager = new PrefManager();
  //bool _res = await prefManager.checkLogin();
  //if (_res) {
    //TODO: Build landing page
  //}
  //return _home;
}




