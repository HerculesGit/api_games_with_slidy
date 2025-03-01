import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            onChanged: (value) {
              controller.email = value;
            },
            decoration: InputDecoration(labelText: "Email"),
          ),
          TextField(
            onChanged: (value) {
              controller.password = value;
            },
            decoration: InputDecoration(labelText: "Senha"),
          ),
          FlatButton(
            onPressed: () {
              controller.login();
            },
            child: Text("Entrar"),
          )
        ],
      ),
    );
  }
}
