import 'package:flutter/material.dart';
import 'package:grapth/res/everex_theme.dart';
import 'package:grapth/walk_count/underline.dart';
import 'package:grapth/walk_count/walk_count_box_item.dart';

class WalkCountBox extends StatefulWidget {
  WalkCountBox({super.key, required this.walkCountList});

  List<WalkCountItem> walkCountList;

  @override
  State<WalkCountBox> createState() => _WalkCountBoxState();
}

class _WalkCountBoxState extends State<WalkCountBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
        decoration: BoxDecoration(
            color: MORAColor.gray6,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: MORAColor.gray4)),
        child: walkCountBoxWidget());
  }

  Widget walkCountBoxWidget() {
    int sevenDaysAgo = widget.walkCountList.length > 7 ?widget.walkCountList.length-7: 0;

    double averageThisWeek = getAverage(widget.walkCountList.sublist(sevenDaysAgo));

    double? averageLastWeek;
    int? difference;

    if (widget.walkCountList.length >= 14) {
      averageLastWeek = getAverage(widget.walkCountList.sublist(sevenDaysAgo-7, sevenDaysAgo));
      difference = averageThisWeek.floor() - averageLastWeek.floor();
    }

    TextStyle titleStyle = moraText.fontSize18
        .copyWith(color: MORAColor.gray1, fontWeight: FontWeight.w700);
    TextStyle differenceStyle =
        moraText.fontSize14.copyWith(color: MORAColor.gray3);

    if (difference == null) {
      return Column(mainAxisSize: MainAxisSize.min, children: [
        Text.rich(
          TextSpan(
            text: '평균 (최근 7일)',
            children: [
              const WidgetSpan(
                  child: SizedBox(
                width: 8,
              )),
              TextSpan(
                text: "${averageThisWeek.floor()}보",
                style: moraText.fontSize16.copyWith(
                    color: const Color(0xFFFDAA2E),
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
          style: moraText.fontSize14.copyWith(color: MORAColor.gray2),
        ),
        Text.rich(
          const TextSpan(text: '다음주엔 이번주 걸음 수와 비교해드릴게요!'),
          style: differenceStyle,
        ),
      ]);
    } else {
      return Column(mainAxisSize: MainAxisSize.min, children: [
        UnderLineText(
          text: '잘하고 있어요 👍',
          textStyle: titleStyle,
          color: Color(0xFFFFEFB9),
        ),
        Text.rich(
          TextSpan(
            text: '평균 (최근 7일)',
            children: [
              const WidgetSpan(
                  child: SizedBox(
                width: 8,
              )),
              TextSpan(
                text: "${averageThisWeek.floor()}보",
                style: moraText.fontSize16.copyWith(
                    color: const Color(0xFFFDAA2E),
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
          style: moraText.fontSize14.copyWith(color: MORAColor.gray2),
        ),
        Text.rich(
          TextSpan(text: '지난주 대비', children: [
            const WidgetSpan(
                child: SizedBox(
              width: 4,
            )),
            difference == 0
                ? const TextSpan(text: '-')
                : TextSpan(text: "${difference.abs()}", children: [
                    difference > 0
                        ? const WidgetSpan(
                            child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Icon(
                                  Icons.arrow_upward_rounded,
                                  size: 10,
                                  color: MORAColor.green,
                                )))
                        : const WidgetSpan(
                            child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Icon(
                                  Icons.arrow_downward_rounded,
                                  size: 10,
                                  color: MORAColor.red,
                                )))
                  ])
          ]),
          style: differenceStyle,
        ),
      ]);
    }
  }

  double getAverage(List<WalkCountItem> boxItemList) {
    int sumBoxItem = 0;
    for (int i = 0; boxItemList.length > i; i++) {
      sumBoxItem += boxItemList[i].value;
      // print(i);
    }
    return sumBoxItem / boxItemList.length;
  }
}
