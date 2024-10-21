import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  final String title;
  const Login({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      color: Colors.blue,
      alignment: Alignment.center,
    );
  }
}
