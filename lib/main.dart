import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:grapth/exercise_ratio/exercise_ratio_linechart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ExerciseRatioLineChart(),
        ),
      ),
    );
  }
}
