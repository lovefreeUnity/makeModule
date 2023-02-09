import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:grapth/res/everex_theme.dart';

class PatientFtLineChart extends StatefulWidget {
  PatientFtLineChart(
      {super.key,
      required this.exerciseRatioDataList,
      required this.startIndex});

  //데이터 를 쓸떼 index에 더해 그래프 데이터 변경 할 때 사용
  int startIndex;
  List<Map<String, dynamic>> exerciseRatioDataList;

  @override
  State<PatientFtLineChart> createState() => _PatientFtLineChartState();
}

class _PatientFtLineChartState extends State<PatientFtLineChart> {
  //태스트 용 리스트
  List<Map<String, dynamic>> exerciseRatioList = [];

  @override
  void initState() {
    exerciseRatioList = widget.exerciseRatioDataList;
  }

  //Tooltip을 띄울 때 터치된 spot을 담을
  LineBarSpot? showLineBarSpotTooltip;

  setTooltipSpots() {
    if (showLineBarSpotTooltip?.spotIndex == null) {
    }else{
      if (showLineBarSpotTooltip?.y != widget.exerciseRatioDataList[showLineBarSpotTooltip!.spotIndex + widget.startIndex]['value']) {
        showLineBarSpotTooltip = null;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    setTooltipSpots();
    return LineChart(
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
        maxY: 180,
        minX: 0,
        maxX: 6,
        lineBarsData: [
          LineChartBarData(
            color: Color(0xFFFFD850),
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
              tooltipBgColor: Color(0xFFFFFBEF),
              // MORA/Sub/100 everex_theme에 없다
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
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: createLeftTitleWidget(),
            bottomTitles: createBottomTitleWidget()),
      ),
    );
  }

  FlDotPainter dotPainter(
      FlSpot spot, double offsetX, LineChartBarData barData, int index) {
    return FlDotCirclePainter(
        //피그마에 MORA/Sub/500* 라고 적혀 있는데 everex_theme에 없는 색상이다.
        color: Color(0xFFFFD850),
        radius: 5,
        strokeWidth: 2,
        circleBorderColor: MORAColor.white);
  }

  List<FlSpot> spotList() {
    List<FlSpot> spotList = [];
    spotList.addAll(List<FlSpot>.generate(
        7,
        (index) => FlSpot(index.toDouble(),
            exerciseRatioList[index + widget.startIndex]['value'])));
    return spotList;
  }

  List<LineTooltipItem> lineTooltipItems(List<LineBarSpot> lineBarSpotList) {
    return List<LineTooltipItem>.generate(
      lineBarSpotList.length,
      (index) => LineTooltipItem(
          "${lineBarSpotList[index].y.floor()}",
          moraText.fontSize16
              .copyWith(color: Color(0xFFFDAA2E), fontWeight: FontWeight.w700),
          children: [
            TextSpan(
                text: " 도",
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
        interval: 30,
        reservedSize: 46,
        getTitlesWidget: (double ratio, TitleMeta meta) => SideTitleWidget(
          axisSide: meta.axisSide,
          child: Text("${ratio.floor()}도",
              textScaleFactor: 1,
              textAlign: TextAlign.center,
              style: leftTitleTextStyle),
        ),
      ),
    );
    return leftTitle;
  }

  AxisTitles createBottomTitleWidget() {
    TextStyle bottomTitleTextStyle =
        moraText.fontSize12.copyWith(color: MORAColor.gray1);
    AxisTitles bottomTitle = AxisTitles(
      sideTitles: SideTitles(
          interval: 1,
          showTitles: true,
          reservedSize: 30,
          getTitlesWidget: (double value, TitleMeta meta) {
            String text =
                exerciseRatioList[value.floor() + widget.startIndex]
                    ['date'];
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
}
