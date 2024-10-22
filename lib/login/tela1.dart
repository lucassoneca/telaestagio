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
    return Scaffold(
      backgroundColor: CupertinoColors.tertiarySystemGroupedBackground,
      body: Padding(padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 400,
                  height: 450,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white, // cor da box
                      borderRadius: BorderRadius.circular(10), //borda arredondada
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1, // Espalhamento da sombra
                          blurRadius: 7, // Desfoque da sombra
                          offset: Offset(0, 3), // Deslocamento horizontal e vertical da sombra
                        )
                      ]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(50),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                    TextFormField(
                      autofocus: true,
                      keyboardType: TextInputType.text,
                      style: new TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                        labelText: ' Nome de usuário ou e-mail',
                        labelStyle: TextStyle(color: Colors.grey),
                        floatingLabelBehavior: FloatingLabelBehavior.never, // O nome fica fixo
                      ),
                    ),

                          SizedBox(height: 25),

                    TextFormField(
                      autofocus: true,
                      keyboardType: TextInputType.text,
                      style: new TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                        labelText: ' Senha',
                        labelStyle: TextStyle(color: Colors.grey),
                        floatingLabelBehavior: FloatingLabelBehavior.never, // O rótulo não se move
                      ),
                    ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
          ),
        ),
      ),
    );
  }
}