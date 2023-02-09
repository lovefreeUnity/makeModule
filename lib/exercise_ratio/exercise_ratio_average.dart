import 'package:flutter/material.dart';

import '../res/everex_theme.dart';

class ExerciseRatioAverage extends StatelessWidget {
  ExerciseRatioAverage(
      {super.key, required this.exerciseRatioList, required this.startIndex});

  List<Map<String,dynamic>> exerciseRatioList;
  int startIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  style: moraText.fontSize14.copyWith(color: MORAColor.gray2),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "${getAverage(exerciseRatioList, startIndex)}%",
                  style: moraText.fontSize20.copyWith(
                      color: MORAColor.primaryColor.shade500,
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
    );
  }
}

getAverage(List<Map<String,dynamic>> list, int startIndex) {
  double sum = 0;
  for (int i = startIndex; i < startIndex + 7; i++) {
    sum += list[i]['value'];
  }
  return (sum / 7).floor();
}
