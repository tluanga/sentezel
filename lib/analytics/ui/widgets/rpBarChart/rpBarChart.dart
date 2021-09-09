import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sentezel/analytics/ui/widgets/rpBarChart/helpers/rpBarChartYTitleGeneartor_helper.dart';

import 'helpers/rpBarchartCalculation_helper.dart';
import 'rpBarChartElement_model.dart';
import 'rpBarChartIndexControl_widget.dart';
import 'rpBarChartPainter_painter.dart';

class RPBarChart extends StatefulWidget {
  final List<RPBarChartElement> data;
  RPBarChart({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  _RPBarChartState createState() => _RPBarChartState();
}

class _RPBarChartState extends State<RPBarChart> {
  List<String> _leftTitle = [];
  int index = 1;
  int noOfPages = 0;
  List<RPBarChartElement> _data = [];
  List<RPBarChartElement> _currentData = [];
  @override
  void initState() {
    if (widget.data.length > 0) {
      _data = widget.data;
      _currentData = _processData(index, _data);
      noOfPages = RPBarChartCalculation.calculateNoOfPages(widget.data.length);
    }
    super.initState();
  }

  @override
  void didUpdateWidget(covariant RPBarChart oldWidget) {
    if (widget.data.length > 0) {
      _data = widget.data;
      _currentData = _processData(index, _data);
      noOfPages = RPBarChartCalculation.calculateNoOfPages(widget.data.length);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          RpChartIndexControl(
            noOfPages: noOfPages,
            onDecrease: (int value) {
              setState(
                () {
                  if (widget.data.length > 0) {
                    index = value;
                    _currentData = _processData(
                      index,
                      widget.data,
                    );

                    print(index);
                  }
                },
              );
            },
            onIncrease: (int value) {
              setState(
                () {
                  if (widget.data.length > 0) {
                    index = value;
                    _currentData = _processData(
                      index,
                      _data,
                    );
                    print(index);
                  }
                },
              );
            },
          ),
          FittedBox(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.36,
              width: MediaQuery.of(context).size.width,
              child: CustomPaint(
                painter: RPBarChartPainter(
                    leftTitle: _leftTitle, list: _currentData),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _processData(int index, List<RPBarChartElement> list) {
    //--------Get Lower Limit and Upper Limit for the current index
    print('processing data');
    List<int> _limits =
        RPBarChartCalculation.calculateLowerAndUpperLimit(list.length, index);

    //------Create a new list from the original list
    final lowerLimit = _limits.first;
    final upperLimit = _limits.last;

    List<RPBarChartElement> _newList = [];
    double _yMaxValue =
        RPBarChartCalculation.findYMaxValue(list, lowerLimit, upperLimit);
    int _counter = 0;
    for (int i = lowerLimit; i <= upperLimit; i++) {
      _newList.add(RPBarChartElement(
          label: list[i].label,
          x: _counter,
          y: RPBarChartCalculation.scaleYValue(
            value: list[i].y,
            maxValue: _yMaxValue,
            scaleMaxValue: 5,
          )));
      _counter++;
    }
    _leftTitle = rpBarChartYTitleGenerator(_yMaxValue.toInt());
    return _newList;
  }
}
