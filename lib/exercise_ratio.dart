import 'package:flutter/material.dart';
import '../res/everex_theme.dart';
import 'exercise_ratio_items/exercise_ratio_average.dart';
import 'exercise_ratio_items/line_exercise_ratio.dart';

class ExerciseRatio extends StatefulWidget {
   ExerciseRatio({
    super.key,
    required this.dataList
  });

  @override
  State<ExerciseRatio> createState() => _ExerciseRatioState();

  List<Map<String, dynamic>> dataList;
}

class _ExerciseRatioState extends State<ExerciseRatio> {

  int startIndex = 0;
  List<Map<String, dynamic>> exerciseRatioList = [];

  @override
  void initState() {
    exerciseRatioList = widget.dataList;
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
              "운동 수행률",
              style: moraText.fontSize16.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Container(
            child: Container(
                height: 201,
                padding: EdgeInsets.fromLTRB(16, 0, 32, 0),
                child: LineExerciseRatio(
                  exerciseRatioDataList: exerciseRatioList,
                  startIndex: startIndex,
                )),
          ),
          dataIndexButtons(),
          SizedBox(
            height: 24,
          ),
          ExerciseRatioAverage(
            exerciseRatioList: exerciseRatioList,
            startIndex: startIndex,
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
