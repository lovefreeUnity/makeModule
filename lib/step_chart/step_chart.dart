
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:grapth/step_chart/step_chart_item.dart';
import 'package:grapth/step_chart/underline.dart';
class StepChart extends StatefulWidget {
  StepChart({super.key});

  @override
  State<StepChart> createState() => _StepChartState();
}

class _StepChartState extends State<StepChart> {
  int showingTooltip = -1;

  late int startItemIndex;
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
  List<int> performRatioList = [
    40,
    58,
    62,
    64,
    82,
    79,
    82,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
  ];
  bool isAddingSummaryData = false;

  @override
  void initState() {
    startItemIndex = 7;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<StepChartItem> stepChartItemList = List<StepChartItem>.generate(performRatioList.length, (index) => StepChartItem(
              dateList[index], performRatioList[index]
            ));
    int maxStep = List<int>.generate(
            7,
            (index) => performRatioList[index + startItemIndex])
        .reduce((value, element) => value > element ? value : element);

    double share = maxStep / 100;
    double maxY = (maxStep % 1000 >= 500 ? 3000 : 1000) + (share.floor() * 1000);
    //maxStep을 10으로 나누면 자릿수를 알수 있지 않을까
    // maxStep의 몫 * 1000
    //maxStep 나머지가 5의 배수 50, 500 보다 크면 + 해준다.
    int maxItem = 7;
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(0, 16, 0, 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "걸음 수",
                  style: TextStyle(fontSize: 16, height: 1.5),
                  textScaleFactor: 1,
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                  height: 231,
                  child: BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.spaceAround,
                      barGroups: List<BarChartGroupData>.generate(
                          maxItem, // stepChartItem.length,
                          (groupIndex) {
                        return BarChartGroupData(
                          barRods: [
                            BarChartRodData(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4),
                                topRight: Radius.circular(4),
                              ),
                              toY:
                                  stepChartItemList[groupIndex + startItemIndex]
                                      .stepCount
                                      ?.toDouble(),
                              color: Color(0xFFFFD850),
                              width: 16,
                            ),
                          ],
                          showingTooltipIndicators:
                              showingTooltip == groupIndex ? [0] : [],
                          x: groupIndex,
                        );
                      }),
                      baselineY: 0,
                      maxY: maxY,
                      barTouchData: BarTouchData(
                        enabled: true,
                        handleBuiltInTouches: false,
                        touchCallback: (event, response) {
                          if (response != null &&
                              response.spot != null &&
                              event is FlTapUpEvent) {
                            setState(() {
                              final x = response.spot!.touchedBarGroup.x;
                              final isShowing = showingTooltip == x;
                              if (isShowing) {
                                showingTooltip = -1;
                              } else {
                                showingTooltip = x;
                              }
                            });
                          }
                        },
                        touchTooltipData: BarTouchTooltipData(
                          maxContentWidth: double.infinity,
                          fitInsideHorizontally: true,
                          fitInsideVertically: true,
                          direction: TooltipDirection.bottom,
                          tooltipMargin: 14,
                          tooltipPadding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                          tooltipRoundedRadius: 4,
                          tooltipBorder: const BorderSide(
                              color: Color(0xFFF2F2F2),
                              width: 1,),
                          tooltipBgColor: Color(0xFFFFFBEF),
                          getTooltipItem: (BarChartGroupData group,
                              int groupIndex,
                              BarChartRodData rod,
                              int rodIndex) {
                            final text = "${rod.toY.floor()}";
                            final textStyle = TextStyle(
                                color: Color(0xFFFDAA2E),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                height: 1.5);
                            //아이템 툴팁 아이템 수정 필요
                            return BarTooltipItem(text, textStyle, children: [
                              TextSpan(
                                  style: TextStyle(
                                    fontSize: 14,
                                    height: 1.5,
                                    color: Color(0xFF747474),
                                  ),
                                  children: [TextSpan(text: " 걸음")]),
                            ]);
                          },
                        ),
                      ),
                      titlesData: FlTitlesData(
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: false,
                          ),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 34,
                              getTitlesWidget: (double value, TitleMeta meta) {
                                return SideTitleWidget(
                                    axisSide: meta.axisSide,
                                    child: Text(
                                      stepChartItemList[
                                      value.floor() + startItemIndex]
                                          .stepDate!,
                                      style:
                                          TextStyle(fontSize: 12, height: 1.5),
                                      textScaleFactor: 1,
                                    ));
                              }),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                              reservedSize: 42,
                              interval: maxY,
                              showTitles: true,
                              getTitlesWidget: (double value, TitleMeta meta) {
                                return SideTitleWidget(
                                  child: Text(
                                    "${value.floor()}",
                                    style: TextStyle(
                                      fontSize: 12,
                                      height: 1.5,
                                      color: Color(0xFFAEAEAE),
                                    ),
                                    textScaleFactor: 1,
                                  ),
                                  axisSide: meta.axisSide,
                                );
                              }),
                        ),
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: false,
                          ),
                        ),
                      ),
                      gridData: FlGridData(
                        show: true,
                        drawHorizontalLine: false,
                        drawVerticalLine: false,
                      ),
                      borderData: FlBorderData(
                          show: true,
                          border: Border(
                              top: BorderSide.merge(
                                  BorderSide(color: Color(0xFFF2F2F2)),
                                  BorderSide(color: Color(0xFFF2F2F2))),
                              bottom: BorderSide.merge(
                                  BorderSide(color: Color(0xFFF2F2F2)),
                                  BorderSide(color: Color(0xFFF2F2F2))))),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: isAddingSummaryData
                          ? null
                          : () async {
                              print("[onClick]");
                              showingTooltip = -1;
                              if (startItemIndex - 7 >= 0) {
                                startItemIndex -= 7;
                                setState(() {});
                              }
                            },
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: Color(0xFF747474),
                              borderRadius: BorderRadius.circular(8)),
                          child: Icon(
                            Icons.arrow_left_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showingTooltip = -1;
                        if (stepChartItemList.length - 7 > startItemIndex) {
                          startItemIndex += 7;
                        }
                        setState(() {});
                      },
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: Color(0xFF747474),
                            borderRadius: BorderRadius.circular(8)),
                        child: Icon(
                          Icons.arrow_right_outlined,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(
                    0xFFF9F9F9,
                  ),
                  border: Border.all(color: Color(0xFFDDDDDD)),
                  borderRadius: BorderRadius.circular(8)),
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  StepBoxTitle(
                      text: "잘하고 있어요 👍",
                      textStyle:
                          const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "평균 (최근 7일)",
                        style: TextStyle(fontSize: 14, height: 1.5),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "12,083보",
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.5,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFDAA2E),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "지난주 대비 1,500",
                        style: TextStyle(fontSize: 14, height: 1),
                      ),
                      Icon(
                        Icons.keyboard_double_arrow_up_rounded,
                        size: 20,
                        color: Color(0xFF2ECC71),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
