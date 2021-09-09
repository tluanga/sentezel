double rpChartScaleYValue({
  // required int earning,
  required int value,
}) {
  int upperLimit = 0;
  if (value <= 50)
    upperLimit = 50;
  else if (value <= 100)
    upperLimit = 100;
  else if (value <= 250)
    upperLimit = 250;
  else if (value <= 500)
    upperLimit = 500;
  else if (value <= 1000)
    upperLimit = 1000;
  else if (value <= 2000)
    upperLimit = 2000;
  else if (value <= 5000)
    upperLimit = 5000;
  else if (value <= 7500)
    upperLimit = 7500;
  else if (value <= 10000)
    upperLimit = 10000;
  else if (value <= 20000)
    upperLimit = 20000;
  else if (value <= 50000)
    upperLimit = 50000;
  else if (value <= 100000)
    upperLimit = 100000;
  else if (value <= 200000)
    upperLimit = 200000;
  else if (value <= 500000)
    upperLimit = 500000;
  else
    upperLimit = 1000000;

  double percentage = (value / upperLimit) * 100;
  double result = (percentage / 100) * 5;

  return result > 5 ? result.roundToDouble() : result;
}
