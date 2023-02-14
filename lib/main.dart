import 'package:flutter/material.dart';
import 'package:grapth/res/everex_theme.dart';
import 'package:grapth/walk_count/walk_count_box.dart';
import 'package:grapth/walk_count/walk_count_box_item.dart';

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
        body: Center(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(16,0,16,0),
            child: WalkCountBox(walkCountList: [
              WalkCountBoxItem(date: 'date', value: 0),
              WalkCountBoxItem(date: 'date', value: 0),
              WalkCountBoxItem(date: 'date', value: 0),
              WalkCountBoxItem(date: 'date', value: 0),
              WalkCountBoxItem(date: 'date', value: 0),
              WalkCountBoxItem(date: 'date', value: 0),
              WalkCountBoxItem(date: 'date', value: 1000),
              WalkCountBoxItem(date: 'date', value: 0),
              WalkCountBoxItem(date: 'date', value: 0),
              WalkCountBoxItem(date: 'date', value: 0),
              WalkCountBoxItem(date: 'date', value: 0),
              WalkCountBoxItem(date: 'date', value: 0),
              WalkCountBoxItem(date: 'date', value: 0),
              WalkCountBoxItem(date: 'date', value: 0),
            ]),
          ),
        ),
      ),
    );
  }
}
