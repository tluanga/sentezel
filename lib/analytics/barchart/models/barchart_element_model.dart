class BarChartElement {
  DateTime date;
  int expense;
  int income;
  int total;
  BarChartElement({
    required this.date,
    required this.expense,
    required this.income,
    this.total = 0,
  });
}
