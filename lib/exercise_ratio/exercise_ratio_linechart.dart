import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:grapth/res/everex_theme.dart';

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

  LineBarSpot? showLineBarSpotTooltip;

  int startIndexForGetData = 0;

  //태스트 용 리스트
  List<Map<String, dynamic>> exerciseRatioList = [];

  @override
  void initState() {
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
              style: moraText.fontSize16,
            ),
          ),
          Container(
            height: 201,
            width: 40 +
                (MediaQuery.of(context).size.width / 7) *
                    exerciseRatioList.length.toDouble(),
            padding: EdgeInsets.fromLTRB(16, 24, 32, 0),
            child: GestureDetector(
              onHorizontalDragEnd: (dragEnd) {
                double dragVelocity = dragEnd.primaryVelocity ?? 0;
                setState(() {
                  showLineBarSpotTooltip = null;
                  if (dragVelocity > 0) {//left
                    if (startIndexForGetData - 7 > -1) {
                      startIndexForGetData -= 7;
                    }
                  }else if (dragVelocity < 0){//right
                    if (startIndexForGetData + 7 < exerciseRatioList.length) {
                      startIndexForGetData += 7;
                    }
                  }
                });
              },
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
                  minX: startIndexForGetData.toDouble(),
                  maxX: startIndexForGetData + 6,
                  lineBarsData: [
                    LineChartBarData(
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
                    ShowingTooltipIndicators(
                        [showLineBarSpotTooltip!])
                  ]
                      : [],
                  lineTouchData: LineTouchData(
                      touchSpotThreshold: 20,
                      enabled: false,
                      handleBuiltInTouches: false,
                      touchTooltipData: LineTouchTooltipData(
                        fitInsideHorizontally: true,
                        fitInsideVertically: true,
                        tooltipMargin: 5,
                        tooltipPadding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                        maxContentWidth: double.infinity,
                        tooltipRoundedRadius: 4,
                        tooltipBgColor: MORAColor.primaryColor.shade100,
                        tooltipBorder:
                        const BorderSide(color: MORAColor.gray5),
                        getTooltipItems: lineTooltipItems,
                      ),
                      touchCallback: (event, response) async {
                        if (response != null &&
                            response.lineBarSpots?[0].spotIndex != null &&
                            event is FlTapUpEvent) {
                          setState(() {
                            showLineBarSpotTooltip =
                            response.lineBarSpots![0];
                          });
                        }
                      }),
                  titlesData: FlTitlesData(
                      topTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false)),
                      rightTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false)),
                      leftTitles: createLeftTitleWidget(),
                      bottomTitles: createBottomTitleWidget()),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          ExerciseRatioAverage(
            exerciseRatioList: exerciseRatioList,
            startIndexForGetData: startIndexForGetData,
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
        strokeColor: MORAColor.primaryColor.shade500,
        strokeWidth: 2,
        circleBorderColor: MORAColor.white);
  }

  List<FlSpot> spotList() {
    List<FlSpot> spotList = List<FlSpot>.generate(
        exerciseRatioList.length,
            (index) =>
            FlSpot(index.toDouble(), exerciseRatioList[index]['value']));
    return spotList.sublist(startIndexForGetData,startIndexForGetData+7);
  }

  List<LineTooltipItem> lineTooltipItems(List<LineBarSpot> lineBarSpotList) {
    return List<LineTooltipItem>.generate(lineBarSpotList.length, (index) {
      return LineTooltipItem(
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
                  : TooltipMode.bottom);
    });
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
            String text =
                exerciseRatioList[value.floor()]['date'];
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

  //테스트 용
  addExerciseRatioList() {
    exerciseRatioList.addAll(List.generate(
        dateList.length,
        (index) => {
              'date': dateList[index],
              'value': exerciseRatioDataList[index].toDouble()
            }));
  }
}

class ExerciseRatioAverage extends StatelessWidget {
  ExerciseRatioAverage(
      {super.key,
      required this.exerciseRatioList,
      required this.startIndexForGetData});

  List<Map<String, dynamic>> exerciseRatioList;
  int startIndexForGetData;

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
                  "${getAverage(exerciseRatioList, startIndexForGetData)}",
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

getAverage(List<Map<String, dynamic>> list, int startIndex) {
  double sum = 0;
  for (int i = startIndex; i < startIndex + 7; i++) {
    sum += list[i]['value'];
  }
  return (sum / 7).floor();
}
