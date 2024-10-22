import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    BoxDecoration(
      border: Border.all(
        color: Colors.black,
        width: 2.0,
      )
    );
    return Scaffold(
      backgroundColor: CupertinoColors.white,
      body: Padding(padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Divider(),
                TextFormField(
                    autofocus: true,
                    keyboardType: TextInputType.text,
                    style: new TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                      labelText: "Nome de usuário ou e-mail",
                    )
                ),
                Divider(),
                TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  style: new TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    labelStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.never, // O rótulo não se move
                  ),
                ),
              ]
            )
          ),
        ),
      );
  }
}