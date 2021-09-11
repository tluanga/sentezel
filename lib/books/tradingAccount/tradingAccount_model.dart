class TradingAccount {
  List<Expense> expense;
  List<Income> income;
  TradingAccount({
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
