import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:grapth/performratio/performratio_linechart.dart';
import 'package:grapth/step_chart/step_chart.dart';

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
          child: PerformRatioLineChart(),
          // child: StepChart(),
        ),
      ),
    );
  }
}
