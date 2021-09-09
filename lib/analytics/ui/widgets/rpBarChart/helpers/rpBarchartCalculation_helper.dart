import 'package:sentezel/analytics/ui/widgets/rpBarChart/rpBarChartElement_model.dart';

class RPBarChartCalculation {
  static int calculateNoOfPages(int length) {
    int a = (length / 7).truncate();
    int b = (length % 7).toInt();

    int noOfPages = b > 0 ? a + 1 : a;

    print('Inside helper noOfPages:$noOfPages');
    print('lengt $length');
    print('a$a');
    print('b$b');
    return noOfPages;
  }

  static List<int> calculateLowerAndUpperLimit(int length, int index) {
    int a = (length / 7).truncate();
    int b = (length % 7).toInt();

    int _pageLimit = b > 0 ? a + 1 : a;
    int lowerLimit = 0;
    int upperLimit = 0;

    if (index == a && index <= _pageLimit) {
      lowerLimit = 7 * (index - 1);
      upperLimit = (7 * index) - 1;
    } else if (index == _pageLimit && b > 0) {
      lowerLimit = 7 * (index - 1);
      upperLimit = ((7 * (index - 1)) + (b - 1));
    } else if (index < _pageLimit) {
      lowerLimit = 7 * (index - 1);
      upperLimit = (7 * index) - 1;
    }
    return [lowerLimit, upperLimit];
  }

  static double scaleYValue({
    required double value,
    required double maxValue,
    required double scaleMaxValue,
  }) {
    int _upperLimit = 0;
    if (maxValue <= 50)
      _upperLimit = 50;
    else if (maxValue <= 100)
      _upperLimit = 100;
    else if (maxValue <= 250)
      _upperLimit = 250;
    else if (maxValue <= 500)
      _upperLimit = 500;
    else if (maxValue <= 1000)
      _upperLimit = 1000;
    else if (maxValue <= 2000)
      _upperLimit = 2000;
    else if (maxValue <= 5000)
      _upperLimit = 5000;
    else if (maxValue <= 7500)
      _upperLimit = 7500;
    else if (maxValue <= 10000)
      _upperLimit = 10000;
    else if (maxValue <= 20000)
      _upperLimit = 20000;
    else if (maxValue <= 50000)
      _upperLimit = 50000;
    else if (maxValue <= 1000000) _upperLimit = 1000000;

    double percentage = (value / _upperLimit) * 100;
    double result = (percentage / 100) * scaleMaxValue;
    return result > 5 ? result.roundToDouble() : result;
  }

  static double findYMaxValue(
    List<RPBarChartElement> list,
    int lowerLimit,
    int upperLimit,
  ) {
    double maxValue = 0;
    for (int i = lowerLimit; i <= upperLimit; i++) {
      if (list[i].y > maxValue) maxValue = list[i].y;
    }
    return maxValue;
  }
}
