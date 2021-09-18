class BalanceSheet {
  int creditors;
  int debtors;
  int capital;
  int netProfit;
  int netLoss;
  int cash;
  int bank;
  List<Asset> asset;
  BalanceSheet({
    required this.creditors,
    required this.debtors,
    required this.capital,
    required this.netProfit,
    required this.netLoss,
    required this.cash,
    required this.bank,
    required this.asset,
  });
}

class Asset {
  String name;
  int amount;
  Asset({
    required this.name,
    required this.amount,
  });
}
