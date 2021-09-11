import 'package:sentezel/analytics/barChart/incomeOrExpense_enum.dart';

class BarChartElement {
  DateTime date;
  int incomeAmount;
  int expenseAmount;
  BarChartElement({
    required this.date,
    required this.incomeAmount,
    required this.expenseAmount,
  });
}
