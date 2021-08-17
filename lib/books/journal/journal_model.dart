class Journal {
  String particular;
  int amount;
  DateTime date;
  String transactionType;
  String? creditSideLedgerName;
  String? debitSideLedgerName;
  String? partyLedgerName;
  String? assetLedgerName;
  String mode;
  Journal({
    required this.particular,
    required this.amount,
    required this.date,
    required this.transactionType,
    this.creditSideLedgerName,
    this.debitSideLedgerName,
    this.partyLedgerName,
    this.assetLedgerName,
    required this.mode,
  });
  String getInitialLetter() {
    return this.particular[0].toUpperCase();
  }
}
