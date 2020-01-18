import 'dart:convert';
import 'package:attempt2/utils/pref_manager.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.url}) : super(key: key);

  final String url;

  @override
  State <StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    final myPass = TextEditingController();
    final myUser = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("login"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
                controller: myUser,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Username",
                )
            ),
            TextField(
                controller: myPass,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password"
                )
            ),
            FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                padding: EdgeInsets.all(8),
                splashColor: Colors.blueAccent,
                onPressed: () async {
                  var url = "http://128.61.56.215/api/android/login.php";
                  var data = json.encode({'username': myUser.text, 'password': myPass.text});
                  Map<String, String> headers = {"Content-type": "application/json"};
                  print("pressed");
                  var response = await http.post(url, headers:headers,  body: data);
                  var jresp = jsonDecode(response.body);
                  if(jresp['success']==1){
                    PrefManager prefManager = new PrefManager();
                    prefManager.setLogin();
                    //TODO: Go to landing page
                  }
                },
                child: Text(
                  "Log in",
                  style: TextStyle(fontSize: 20),
                )
            )
          ],
        ),
      ),
    );
  }
}

