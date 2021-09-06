import 'package:sentezel/books/ledger/ledgerTransaction/ledgerTransaction_model.dart';

class LedgerReport {
  int ledgerId;
  String name;
  String description;
  int creditAmount;
  int debitAmount;
  List<LedgerTransaction>? ledgerTransaction;
  LedgerReport({
    required this.ledgerId,
    required this.name,
    required this.description,
    required this.creditAmount,
    required this.debitAmount,
    this.ledgerTransaction,
  });
  String getInitialLetter() {
    return this.name[0].toUpperCase();
  }
}
