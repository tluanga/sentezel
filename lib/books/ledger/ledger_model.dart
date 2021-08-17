class LedgerReport {
  int ledgerId;
  String name;
  String description;
  int creditAmount;
  int debitAmount;
  LedgerReport({
    required this.ledgerId,
    required this.name,
    required this.description,
    required this.creditAmount,
    required this.debitAmount,
  });
  String getInitialLetter() {
    return this.name[0].toUpperCase();
  }
}
