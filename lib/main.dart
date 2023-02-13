import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:grapth/information_provision/consent_to_provision_information_page.dart';
import 'package:grapth/res/everex_theme.dart';
import 'package:grapth/step_chart/underline.dart';
import 'package:intl/intl.dart';
import 'test/mora_walk_count_summary_vo.dart';
import 'test/unserline_text.dart';

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
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConsentToProvisionInformationPage(),
            ],
          ),
        ),
      ),
    );
  }
}