import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({
    Key? key,
    required this.xAxisScalingValues,
    required this.maxYaxisValue,
    required this.yAxissalesSpots,
    required this.yAxisexpenseSpots,
  }) : super(key: key);

  final List<String> xAxisScalingValues;
  final double maxYaxisValue;
  final List<double> yAxissalesSpots;
  final List<double> yAxisexpenseSpots;

  @override
  Widget build(BuildContext context) {
    List<Color> gradientColors = [
      const Color(0xff23b6e6),
      const Color(0xff02d39a),
    ];
    List<Color> salesColors = [
      Colors.green
      // Color(0xff23b6e6),
      // Color(0xff02d39a),
    ];
    List<Color> expenseColors = [Colors.blue.shade200, Colors.blue.shade400];
    return Container(
      padding: const EdgeInsets.all(9),
      // color: Colors.white,
      child: LineChart(LineChartData(
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                // color: const Color(0xff37434d),
                color: Colors.grey.shade200,
                strokeWidth: 0.5,
              );
            },
            getDrawingVerticalLine: (value) {
              return FlLine(
                color: const Color(0xff37434d),
                strokeWidth: 1,
              );
            },
          ),
          titlesData: FlTitlesData(
              rightTitles: SideTitles(showTitles: false),
              topTitles: SideTitles(showTitles: false),
              bottomTitles: SideTitles(
                showTitles: true,
                reservedSize: 50,
                getTextStyles: (context, val) => const TextStyle(
                  color: Color(0xff68737d),
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                getTitles: (x) {
                  switch (x.toInt()) {
                    case 0:
                      return xAxisScalingValues[0];
                    case 2:
                      return xAxisScalingValues[1];
                    case 4:
                      return xAxisScalingValues[2];
                    case 6:
                      return xAxisScalingValues[3];
                    case 8:
                      return xAxisScalingValues[4];
                    case 10:
                      return xAxisScalingValues[5];
                    case 12:
                      return xAxisScalingValues[6];
                  }
                  return '';
                },
                margin: 30,
              ),
              leftTitles: SideTitles(
                  //  interval: 5, // maxYaxisValue / 6,
                  reservedSize: 0, // MediaQuery.of(context).size.width * 0.09,
                  showTitles: false,
                  getTextStyles: (context, val) => const TextStyle(
                        color: Color(0xff67727d),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                  getTitles: (y) {
                    return y.toInt().toString();
                  })),
          borderData: FlBorderData(
              show: false,
              border: Border.all(
                  color: Colors.grey.shade400,
                  // Color(0xff37434d),

                  width: 0.5)),
          minX: 0,
          maxX: 12,
          minY: 0,
          // finding the max value of sales per day
          maxY: maxYaxisValue,
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, yAxissalesSpots[0]),
                FlSpot(2, yAxissalesSpots[1]),
                FlSpot(4, yAxissalesSpots[2]),
                FlSpot(6, yAxissalesSpots[3]),
                FlSpot(8, yAxissalesSpots[4]),
                FlSpot(10, yAxissalesSpots[5]),
                FlSpot(12, yAxissalesSpots[6]),
              ],
              isCurved: true,
              colors: salesColors,
              barWidth: 5,
              isStrokeCapRound: true,
              belowBarData: BarAreaData(
                show: true,
                colors: salesColors.map((e) => e.withOpacity(0.1)).toList(),
              ),
              dotData: FlDotData(
                show: false,
              ),
            ),
            LineChartBarData(
              spots: [
                FlSpot(0, yAxisexpenseSpots[0]),
                FlSpot(2, yAxisexpenseSpots[1]),
                FlSpot(4, yAxisexpenseSpots[2]),
                FlSpot(6, yAxisexpenseSpots[3]),
                FlSpot(8, yAxisexpenseSpots[4]),
                FlSpot(10, yAxisexpenseSpots[5]),
                FlSpot(12, yAxisexpenseSpots[6]),
              ],
              isCurved: true,
              colors: expenseColors,
              // colors: [
              //   ColorTween(begin: expenseColors[0], end: expenseColors[1])
              //       .lerp(0.2)!,
              //   ColorTween(begin: expenseColors[0], end: expenseColors[1])
              //       .lerp(0.2)!,
              // ],
              barWidth: 5,
              isStrokeCapRound: true,
              belowBarData: BarAreaData(
                show: true,
                colors: expenseColors.map((e) => e.withOpacity(0.3)).toList(),
              ),
              // belowBarData: BarAreaData(show: true, colors: [
              //   ColorTween(begin: expenseColors[0], end: expenseColors[1])
              //       .lerp(0.2)!
              //       .withOpacity(0.1),
              //   ColorTween(begin: expenseColors[0], end: expenseColors[1])
              //       .lerp(0.2)!
              //       .withOpacity(0.1),
              // ]),
              dotData: FlDotData(
                show: false,
              ),
            ),
          ])),
    );
  }
}
//

class LineChartSample2 extends StatefulWidget {
  final List<String> xAxisScalingValues;
  final double maxYaxisValue;
  final List<double> yAxissalesSpots;
  final List<double> yAxisexpenseSpots;
  const LineChartSample2(
      {Key? key,
      required this.xAxisScalingValues,
      required this.maxYaxisValue,
      required this.yAxissalesSpots,
      required this.yAxisexpenseSpots})
      : super(key: key);

  @override
  _LineChartSample2State createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                ),
                color: Color(0xff232d37)),
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 18.0, left: 12.0, top: 24, bottom: 12),
              child: LineChart(
                showAvg ? avgData() : mainData(widget.xAxisScalingValues),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 60,
          height: 34,
          child: TextButton(
            onPressed: () {
              setState(() {
                showAvg = !showAvg;
              });
            },
            child: Text(
              'avg',
              style: TextStyle(
                  fontSize: 12,
                  color:
                      showAvg ? Colors.white.withOpacity(0.5) : Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData mainData(List<String> xAxisScalingValues) {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
          show: true,
          rightTitles: SideTitles(showTitles: false),
          topTitles: SideTitles(showTitles: false),
          bottomTitles: SideTitles(
            showTitles: true,
            reservedSize: 22,
            interval: 1,
            getTextStyles: (context, value) => const TextStyle(
                color: Color(0xff68737d),
                fontWeight: FontWeight.bold,
                fontSize: 16),
            getTitles: (value) {
              switch (value.toInt()) {
                case 0:
                  return xAxisScalingValues[0];
                case 2:
                  return xAxisScalingValues[1];
                case 4:
                  return xAxisScalingValues[2];
                case 6:
                  return xAxisScalingValues[3];
                case 8:
                  return xAxisScalingValues[4];
                case 10:
                  return xAxisScalingValues[5];
                case 12:
                  return xAxisScalingValues[6];
              }
              return '';
            },
            margin: 8,
          ),
          leftTitles: SideTitles(
              showTitles: true,
              interval: widget.maxYaxisValue / 5,
              getTextStyles: (context, value) => const TextStyle(
                    color: Color(0xff67727d),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
              reservedSize: MediaQuery.of(context).size.width * 0.1,
              // showTitles: true,
              // getTextStyles: (context, val) => const TextStyle(
              //       color: Colors.grey,
              //       fontWeight: FontWeight.bold,
              //       fontSize: 12,
              //     ),
              getTitles: (y) {
                return y.toInt().toString();
              })

          // //  getTitles: (value) {
          //     switch (value.toInt()) {
          //       case 1:
          //         return '10k';
          //       case 3:
          //         return '30k';
          //       case 5:
          //         return '50k';
          //     }
          //     return '';
          //   },
          //
          // reservedSize: 32,
          // margin: 12,

          ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      // minX: 0,
      // maxX: 11,
      // minY: 0,
      // maxY: 6,
      minX: 0,
      maxX: 12,
      minY: 0,
      maxY: widget.maxYaxisValue,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }

  LineChartData avgData() {
    return LineChartData(
      lineTouchData: LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (context, value) => const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return 'MAR';
              case 5:
                return 'JUN';
              case 8:
                return 'SEP';
            }
            return '';
          },
          margin: 8,
          interval: 1,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '50k';
            }
            return '';
          },
          reservedSize: 32,
          interval: 1,
          margin: 12,
        ),
        topTitles: SideTitles(showTitles: false),
        rightTitles: SideTitles(showTitles: false),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 3.44),
            FlSpot(2.6, 3.44),
            FlSpot(4.9, 3.44),
            FlSpot(6.8, 3.44),
            FlSpot(8, 3.44),
            FlSpot(9.5, 3.44),
            FlSpot(11, 3.44),
          ],
          isCurved: true,
          colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)!,
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)!,
          ],
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(show: true, colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)!
                .withOpacity(0.1),
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)!
                .withOpacity(0.1),
          ]),
        ),
      ],
    );
  }
}
