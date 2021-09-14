class TradingAccount {
  int grossProfit;
  int grossLoss;
  List<Expense> expense;
  List<Income> income;
  TradingAccount({
    required this.grossProfit,
    required this.grossLoss,
    required this.expense,
    required this.income,
  });
}

class Expense {
  int totalCredit;
  int totalDebit;
  String ledgerName;
  Expense({
    required this.totalCredit,
    required this.totalDebit,
    required this.ledgerName,
  });
}

class Income {
  int totalCredit;
  int totalDebit;
  String ledgerName;
  Income({
    required this.totalCredit,
    required this.totalDebit,
    required this.ledgerName,
  });
}
