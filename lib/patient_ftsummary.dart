import 'package:flutter/material.dart';
import '../res/everex_theme.dart';
import 'patient_ft_summary_items/patent_ft_header.dart';
import 'patient_ft_summary_items/patient_ftsummary_average.dart';
import 'patient_ft_summary_items/patient_ftsummary_linechart.dart';

class PatientFtSummaryPage extends StatefulWidget {
  PatientFtSummaryPage({
    super.key,
    required this.dataList
  });
  List<Map<String,dynamic>> dataList;
  @override
  State<PatientFtSummaryPage> createState() => _PatientFtSummaryPageState();
}

class _PatientFtSummaryPageState extends State<PatientFtSummaryPage> {

  int startIndex = 0;
  List<Map<String, dynamic>> exerciseRatioList = [];
  @override
  void initState() {
    exerciseRatioList = widget.dataList;
    super.initState();
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
            text: "앞으로 팔 벌리기",
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
          PatientFtAverage(
              exerciseRatioList: exerciseRatioList, startIndex: startIndex)
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
