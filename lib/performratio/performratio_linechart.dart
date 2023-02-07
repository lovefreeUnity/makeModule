import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PerformRatioLineChart extends StatefulWidget {
  const PerformRatioLineChart({Key? key}) : super(key: key);

  @override
  State<PerformRatioLineChart> createState() => _PerformRatioLineChartState();
}

class _PerformRatioLineChartState extends State<PerformRatioLineChart> {
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
  List<int> performRatioDataList = [
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

  int showingTooltip = -1;

  LineBarSpot? showLineBarSpotTooltip;

  List<double> performRatioList = [];

  Map<String, double> values = {
    'minY': 0,
    'maxY': 100,
    'minX': 0,
    'maxX': 6,
  };

  @override
  void initState() {
    addPerformRatioList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
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
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Container(
            child: Container(
              color: Colors.white,
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
                        color: Color(0xFFF2F2F2),
                        strokeWidth: 1,
                      );
                    },
                    drawVerticalLine: false,
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border(
                        top: BorderSide(
                          color: Color(0xFfF2F2F2),
                        ),
                        bottom: BorderSide(
                          color: Color(0xFFDDDDDD),
                        )),
                  ),
                  minY: values['minY'],
                  maxY: values['maxY'],
                  minX: values['minX'],
                  maxX: values['maxX'],
                  lineBarsData: [
                    LineChartBarData(
                      isCurved: false,
                      show: true,
                      color: const Color(0xFF07BEB8),
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
                        maxContentWidth: double.infinity,
                        tooltipRoundedRadius: 4,
                        tooltipBgColor: const Color(0xFFF0FCFC),
                        tooltipBorder:
                            const BorderSide(color: Color(0xFFF2F2F2)),
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
                  // backgroundColor: Color(0xFFFFFFFF)
                ),
              ),
            ),
          ),
          dataIndexButtons(),
          SizedBox(
            height: 24,
          ),
          PerformRatioAverage(
            performRatioList: performRatioList,
            startIndex: startIndex,
          )
        ],
      ),
    );
  }

  FlDotPainter dotPainter(
      FlSpot spot, double percent, LineChartBarData barData, int index) {
    return FlDotCirclePainter(
        color: Color(0xFF9CE5E3),
        radius: 4,
        strokeColor: Color(0xFF07BEB8),
        strokeWidth: 2,
        circleBorderColor: Colors.white);
  }

  List<FlSpot> spotList() {
    List<FlSpot> spotList = [];
    spotList.addAll(List<FlSpot>.generate(
      7,
      (index) =>FlSpot(index.toDouble(), performRatioList[index + startIndex])
    );
    return spotList;
  }

  List<LineTooltipItem> lineTooltipItems(List<LineBarSpot> lineBarSpotList) {
    return List<LineTooltipItem>.generate(
      lineBarSpotList.length,
      (index) => LineTooltipItem(
          "${lineBarSpotList[index].y.floor()}",
          const TextStyle(
            fontSize: 14,
            height: 1.5,
          ),
          children: [
            TextSpan(
                text: " %",
                style: TextStyle(
                    fontSize: 14, height: 1.5, color: Color(0xFF747474)))
          ],
          showTooltipMode:
              lineBarSpotList[index].y > 30 && lineBarSpotList[index].y < 71
                  ? TooltipMode.top
                  : TooltipMode.bottom),
    );
  }

  AxisTitles createLeftTitleWidget() {
    TextStyle leftTitleTextStyle = const TextStyle(
      fontSize: 12,
      height: 1.5,
    );
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
    TextStyle bottomTitleTextStyle = const TextStyle(fontSize: 12, height: 1.5);
    AxisTitles bottomTitle = AxisTitles(
      sideTitles: SideTitles(
          interval: 1,
          showTitles: true,
          reservedSize: 30,
          getTitlesWidget: (double value, TitleMeta meta) {
            String text = dateList[value.floor() + startIndex];
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
        if (startIndex - 7 >= 0) {
          startIndex -= 7;
        }
        setState(() {
          showLineBarSpotTooltip = null;
        });
      },
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: Color(0xFF747474), borderRadius: BorderRadius.circular(8)),
        child: Icon(
          Icons.arrow_left_outlined,
          color: Colors.white,
        ),
      ),
    );
  }

  InkWell rightButton() {
    return InkWell(
      onTap: () {
        if (startIndex + 7 < dateList.length) {
          startIndex += 7;
          addPerformRatioList();
        }
        setState(() {
          showLineBarSpotTooltip = null;
        });
      },
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: Color(0xFF747474), borderRadius: BorderRadius.circular(8)),
        child: Icon(
          Icons.arrow_right_outlined,
          color: Colors.white,
        ),
      ),
    );
  }

  addPerformRatioList() {
    performRatioList.addAll(List.generate(
        7, (index) => performRatioDataList[startIndex + index].toDouble()));
  }
}

class PerformRatioAverage extends StatelessWidget {
  PerformRatioAverage({super.key,required this.performRatioList,required this.startIndex});

  List<double> performRatioList;
  int startIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xFFF9F9F9),
            border: Border.all(
              color: Color(0xFFDDDDDD),
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
                  style: TextStyle(fontSize: 14, height: 1.5),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "${getAverage(performRatioList, startIndex)}",
                  style: TextStyle(
                      fontSize: 20, height: 1.5, fontWeight: FontWeight.bold),
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

getAverage(List<double> list, int startIndex) {
  double sum = 0;
  for (int i = startIndex; i < startIndex + 7; i++) {
    sum += list[i];
  }
  return (sum / 7).floor();
}
