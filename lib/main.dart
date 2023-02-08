
import 'package:flutter/material.dart';
import 'exercise_summary/exercise_summary_linechart.dart';

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
