import 'package:flutter/material.dart';
import 'package:grapth/patient_ftsummary/patient_ftsummary_linechart.dart';

import '../patient_ftsummary/patent_ft_header.dart';
import '../patient_ftsummary/patient_ftsummary_average.dart';
import '../res/everex_theme.dart';

class PatientFtSummaryPage extends StatefulWidget {
  const PatientFtSummaryPage({
    super.key,
  });

  @override
  State<PatientFtSummaryPage> createState() => _PatientFtSummaryPageState();
}

class _PatientFtSummaryPageState extends State<PatientFtSummaryPage> {
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

  int startIndex = 0;
  List<Map<String, dynamic>> exerciseRatioList = [];

  addExerciseRatioList() {
    exerciseRatioList.addAll(List.generate(
        exerciseRatioDataList.length,
        (index) => {
              'date': dateList[startIndex + index],
              'value':
                  exerciseRatioDataList[startIndex + index].toDouble()
            }));
  }

  @override
  void initState() {
    moraText.setTextStyle();
    addExerciseRatioList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MORAColor.white,
      padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Text(
              "AI 기능평가",
              style: moraText.fontSize16.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          PatientFtHeader(
            text: "앞으로 팔 올리기",
            textStyle: moraText.fontSize18
                .copyWith(color: MORAColor.gray1, fontWeight: FontWeight.w700),
            showLeftButton: false,
          ),
          SizedBox(
            height: 24,
          ),
          Container(
            child: Container(
                height: 201,
                padding: EdgeInsets.fromLTRB(16, 0, 32, 0),
                child: PatientFtLineChart(
                  exerciseRatioDataList: exerciseRatioList,
                  startIndex: startIndex,
                )),
          ),
          dataIndexButtons(),
          SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Container(
              decoration: BoxDecoration(
                  color: MORAColor.gray6,
                  border: Border.all(
                    color: MORAColor.gray4,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(8))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "평균",
                        style: moraText.fontSize14
                            .copyWith(color: MORAColor.gray2),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "${getAverage(exerciseRatioList, startIndex)}도",
                        style: moraText.fontSize20.copyWith(
                            color: Color(0xFfFDAA2E),
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget dataIndexButtons() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [leftButton(), rightButton()],
      ),
    );
  }

  InkWell leftButton() {
    return InkWell(
      onTap: () {
        if (startIndex - 7 >= 0) {
          startIndex -= 7;
        }
        setState(() {});
      },
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: MORAColor.gray2, borderRadius: BorderRadius.circular(8)),
        child: Icon(
          Icons.arrow_left_outlined,
          color: MORAColor.white,
        ),
      ),
    );
  }

  InkWell rightButton() {
    return InkWell(
      onTap: () {
        if (startIndex + 7 < exerciseRatioList.length) {
          startIndex += 7;
        }
        setState(() {});
      },
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: MORAColor.gray2, borderRadius: BorderRadius.circular(8)),
        child: Icon(
          Icons.arrow_right_outlined,
          color: MORAColor.white,
        ),
      ),
    );
  }
}

getAverage(List<Map<String, dynamic>> list, int startIndex) {
  double sum = 0;
  for (int i = startIndex; i < startIndex + 7; i++) {
    sum += list[i]['value'];
  }
  return (sum / 7).floor();
}
