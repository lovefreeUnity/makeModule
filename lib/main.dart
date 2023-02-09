
import 'package:flutter/material.dart';

import 'exercise_ratio/line_exercise_ratio.dart';
import 'patient_ftsummary/patient_ftsummary_linechart.dart';

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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LineExerciseRatio(),
            PatientFtLineChart()
          ],
        ),
      ),
    );
  }
}
