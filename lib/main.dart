
import 'package:flutter/material.dart';
import 'package:grapth/res/everex_theme.dart';

void main() {
  moraText.setTextStyle();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container()
      ),
    );
  }
}
