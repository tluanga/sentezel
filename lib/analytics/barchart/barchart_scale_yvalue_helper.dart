double scaleYValue({
  required int value,
  required int highestValue,
}) {
  int _maxCeiling = highestValue;
  if (highestValue <= 250) {
    _maxCeiling = 250;
  } else if (highestValue <= 500) {
    _maxCeiling = 500;
  } else if (highestValue <= 1000) {
    _maxCeiling = 1000;
  } else if (highestValue <= 2000) {
    _maxCeiling = 2000;
  } else if (highestValue <= 5000) {
    _maxCeiling = 5000;
  } else if (highestValue <= 7500) {
    _maxCeiling = 7500;
  } else if (highestValue <= 10000) {
    _maxCeiling = 10000;
  } else if (highestValue <= 20000) {
    _maxCeiling = 20000;
  } else if (highestValue <= 50000) {
    _maxCeiling = 50000;
  } else if (highestValue <= 100000) {
    _maxCeiling = 100000;
  } else if (highestValue <= 200000) {
    _maxCeiling = 200000;
  } else if (highestValue <= 500000) {
    _maxCeiling = 500000;
  } else if (highestValue <= 1000000) {
    _maxCeiling = 1000000;
  }
  double percentage = (value / _maxCeiling) * 100;
  double result = (percentage / 100) * 5;
  return result > 5 ? result.roundToDouble() : result;
}
