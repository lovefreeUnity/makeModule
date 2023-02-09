
import 'package:flutter/material.dart';
import 'package:grapth/exercise_ratio.dart';
import 'package:grapth/res/everex_theme.dart';
import 'patient_ftsummary.dart';


List<String> dateList = [
  '07.01',
  '07.02',
  '07.03',
  '07.04',
  '07.05',
  '07.06',
  '07.07',
  '07.08',
  '07.09',
  '07.10',
  '07.11',
  '07.12',
  '07.13',
  '07.14',
];
List<int> exerciseRatioDataList = [
  40,
  58,
  62,
  64,
  82,
  79,
  82,
  12,
  18,
  30,
  31,
  70,
  71,
  100,
];
List<Map<String,dynamic>> dataList = [];
addDataList() {
  dataList.addAll(List.generate(
      exerciseRatioDataList.length,
          (index) => {
        'date': dateList[index],
        'value': exerciseRatioDataList[index].toDouble()
      }));
}

void main() {
  moraText.setTextStyle();
  addDataList();
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
              ExerciseRatio(dataList: dataList,),
              PatientFtSummaryPage(dataList: dataList,)
            ],
          ),
        ),
      ),
    );
  }
}
