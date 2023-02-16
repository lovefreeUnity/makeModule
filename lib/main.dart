import 'package:flutter/material.dart';
import 'package:grapth/LoginPage.dart';
import 'package:grapth/res/everex_theme.dart';

void main() {
  moraText.setTextStyle();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage()
    );
  }
}
