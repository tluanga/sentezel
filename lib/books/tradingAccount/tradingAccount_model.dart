import 'package:sentezel/books/tradingAccount/expense_model.dart';

class TradingAccount {
  String ledgerName;
  int creditAmount;
  int debitAmount;
  List<Expense> expense;
  List<Income> income;
  TradingAccount({
    required this.ledgerName,
    required this.creditAmount,
    required this.debitAmount,
    required this.expense,
    required this.income,
  });
}
