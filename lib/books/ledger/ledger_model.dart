import 'package:sentezel/books/ledger/ledger_transaction/ledger_transaction_model.dart';

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
    return name[0].toUpperCase();
  }

  LedgerReport copyWith({
    int? ledgerId,
    String? name,
    String? description,
    int? creditAmount,
    int? debitAmount,
    List<LedgerTransaction>? ledgerTransaction,
  }) {
    return LedgerReport(
      ledgerId: ledgerId ?? this.ledgerId,
      name: name ?? this.name,
      description: description ?? this.description,
      creditAmount: creditAmount ?? this.creditAmount,
      debitAmount: debitAmount ?? this.debitAmount,
      ledgerTransaction: ledgerTransaction ?? this.ledgerTransaction,
    );
  }
}
