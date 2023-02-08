import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:grapth/res/everex_theme.dart';
import 'exercise_summary_average.dart';

class ExerciseRatioLineChart extends StatefulWidget {
  const ExerciseRatioLineChart({Key? key}) : super(key: key);

  @override
  State<ExerciseRatioLineChart> createState() => _ExerciseRatioLineChartState();
}

class _ExerciseRatioLineChartState extends State<ExerciseRatioLineChart> {
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

  int startIndexForGetData = 0;

  int showingTooltip = -1;

  LineBarSpot? showLineBarSpotTooltip;

  //태스트 용 리스트
  List<Map<String,dynamic>> exerciseRatioList = [];

  //테스트 용
  addExerciseRatioList() {
    exerciseRatioList.addAll(List.generate(
        7,
            (index) => {
          'date' : dateList[startIndexForGetData + index],
          'value' : exerciseRatioDataList[startIndexForGetData + index].toDouble()
        }
    ));
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
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(
                    horizontalInterval: 20,
                    verticalInterval: 1,
                    drawHorizontalLine: true,
                    getDrawingHorizontalLine: (double) {
                      return FlLine(
                        color: MORAColor.gray5,
                        strokeWidth: 1,
                      );
                    },
                    drawVerticalLine: false,
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border(
                        top: BorderSide(
                          color: MORAColor.gray5,
                        ),
                        bottom: BorderSide(
                          color: MORAColor.gray4,
                        )),
                  ),
                  minY: 0,
                  maxY: 100,
                  minX: 0,
                  maxX: 6,
                  lineBarsData: [
                    LineChartBarData(
                      color: MORAColor.primaryColor.shade500,
                      isCurved: false,
                      show: true,
                      spots: spotList(),
                      dotData: FlDotData(
                        show: true,
                        getDotPainter: dotPainter,
                      ),
                    ),
                  ],
                  showingTooltipIndicators: showLineBarSpotTooltip != null
                      ? [
                          ShowingTooltipIndicators([showLineBarSpotTooltip!])
                        ]
                      : [],
                  lineTouchData: LineTouchData(
                      touchSpotThreshold: 20,
                      handleBuiltInTouches: false,
                      touchTooltipData: LineTouchTooltipData(
                        fitInsideHorizontally: true,
                        fitInsideVertically: true,
                        tooltipMargin: 5,
                        tooltipPadding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                        maxContentWidth: double.infinity,
                        tooltipRoundedRadius: 4,
                        tooltipBgColor: MORAColor.primaryColor.shade100,
                        tooltipBorder: const BorderSide(color: MORAColor.gray5),
                        getTooltipItems: lineTooltipItems,
                      ),
                      touchCallback: (event, response) async {
                        if (response != null &&
                            response.lineBarSpots?[0].spotIndex != null &&
                            event is FlTapUpEvent) {
                          setState(() {
                            showLineBarSpotTooltip = response.lineBarSpots![0];
                          });
                        }
                      }),
                  titlesData: FlTitlesData(
                      topTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      leftTitles: createLeftTitleWidget(),
                      bottomTitles: createBottomTitleWidget()),
                ),
              ),
            ),
          ),
          dataIndexButtons(),
          SizedBox(
            height: 24,
          ),
          ExerciseRatioAverage(
            exerciseRatioList: exerciseRatioList,
            startIndex: startIndexForGetData,
          )
        ],
      ),
    );
  }

  FlDotPainter dotPainter(
      FlSpot spot, double offsetX, LineChartBarData barData, int index) {
    return FlDotCirclePainter(
        color: MORAColor.primaryColor.shade300,
        radius: 5,
        strokeWidth: 2,
        circleBorderColor: MORAColor.white);
  }

  List<FlSpot> spotList() {
    List<FlSpot> spotList = [];
    spotList.addAll(List<FlSpot>.generate(
        7,
        (index) => FlSpot(index.toDouble(),
            exerciseRatioList[index + startIndexForGetData]['value'])));
    return spotList;
  }

  List<LineTooltipItem> lineTooltipItems(List<LineBarSpot> lineBarSpotList) {
    return List<LineTooltipItem>.generate(
      lineBarSpotList.length,
      (index) => LineTooltipItem(
          "${lineBarSpotList[index].y.floor()}",
          moraText.fontSize16.copyWith(
              color: MORAColor.mintColorSub, fontWeight: FontWeight.w700),
          children: [
            TextSpan(
                text: " %",
                style: moraText.fontSize14.copyWith(color: MORAColor.gray2))
          ],
          showTooltipMode:
              lineBarSpotList[index].y > 30 && lineBarSpotList[index].y < 71
                  ? TooltipMode.top
                  : TooltipMode.bottom),
    );
  }

  AxisTitles createLeftTitleWidget() {
    TextStyle leftTitleTextStyle =
        moraText.fontSize12.copyWith(color: MORAColor.gray3);
    AxisTitles leftTitle = AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        interval: 20,
        reservedSize: 38,
        getTitlesWidget: (double ratio, TitleMeta meta) => SideTitleWidget(
          axisSide: meta.axisSide,
          child: Text("${ratio.floor()}%",
              textScaleFactor: 1,
              textAlign: TextAlign.center,
              style: leftTitleTextStyle),
        ),
      ),
    );
    return leftTitle;
  }

  AxisTitles createBottomTitleWidget() {
    TextStyle bottomTitleTextStyle = moraText.fontSize12.copyWith(color: MORAColor.gray1);
    AxisTitles bottomTitle = AxisTitles(
      sideTitles: SideTitles(
          interval: 1,
          showTitles: true,
          reservedSize: 30,
          getTitlesWidget: (double value, TitleMeta meta) {
            String text = exerciseRatioList[value.floor() + startIndexForGetData]['date'];
            return SideTitleWidget(
              axisSide: meta.axisSide,
              space: 5,
              child: Text(
                text,
                style: bottomTitleTextStyle,
              ),
            );
          }),
    );

    return bottomTitle;
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
        if (startIndexForGetData - 7 >= 0) {
          startIndexForGetData -= 7;
        }
        setState(() {
          showLineBarSpotTooltip = null;
        });
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
        if (startIndexForGetData + 7 < dateList.length) {
          startIndexForGetData += 7;
          addExerciseRatioList();
        }
        setState(() {
          showLineBarSpotTooltip = null;
        });
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