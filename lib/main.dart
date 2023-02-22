import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:grapth/information_provision/consent_to_provision_information_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Pretendard'),
      home:ConsentToProvisionInformationPage(),
    );
  }
}