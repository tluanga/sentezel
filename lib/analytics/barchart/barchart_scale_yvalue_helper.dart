double scaleYValue({
  required int value,
  required int highestValue,
}) {
  double percentage = (value / highestValue) * 100;
  double result = (percentage / 100) * 5;
  return result > 5 ? result.roundToDouble() : result;
}
