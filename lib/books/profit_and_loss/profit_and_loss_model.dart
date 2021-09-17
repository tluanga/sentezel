class ProfitAndLoss {
  int grossProfit;
  int grossLoss;
  int netProfit;
  int netLoss;
  List<IndirectIncome> indirectIncome;
  List<IndirectExpense> indirectExpense;
  ProfitAndLoss({
    required this.grossProfit,
    required this.grossLoss,
    required this.netProfit,
    required this.netLoss,
    required this.indirectIncome,
    required this.indirectExpense,
  });
}

class IndirectIncome {
  String ledgerName;
  int totalDebit;
  int totalCredit;
  IndirectIncome({
    required this.ledgerName,
    required this.totalDebit,
    required this.totalCredit,
  });
}

class IndirectExpense {
  String ledgerName;
  int totalDebit;
  int totalCredit;
  IndirectExpense({
    required this.ledgerName,
    required this.totalDebit,
    required this.totalCredit,
  });
}
