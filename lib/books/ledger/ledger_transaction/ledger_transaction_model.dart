import 'package:sentezel/common/enums/debit_or_credit_enum.dart';
import 'package:sentezel/new_transaction/data/transaction_model.dart';

class LedgerTransaction {
  int amount;
  DebitOrCredit debitOrCredit;
  Transaction? transaction;
  LedgerTransaction({
    required this.amount,
    required this.debitOrCredit,
    this.transaction,
  });
}
