class TradingAccount {
  int grossProfit;
  int grossLoss;
  List<DirectExpense> directExpense;
  List<DirectIncome> directIncome;
  TradingAccount({
    required this.grossProfit,
    required this.grossLoss,
    required this.directExpense,
    required this.directIncome,
  });
}

class DirectExpense {
  int totalCredit;
  int totalDebit;
  String ledgerName;
  DirectExpense({
    required this.totalCredit,
    required this.totalDebit,
    required this.ledgerName,
  });
}

class DirectIncome {
  int totalCredit;
  int totalDebit;
  String ledgerName;
  DirectIncome({
    required this.totalCredit,
    required this.totalDebit,
    required this.ledgerName,
  });
}
