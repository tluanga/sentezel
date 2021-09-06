import 'package:sentezel/common/enums/debitOrCredit_enum.dart';
import 'package:sentezel/newTransaction/data/transaction_model.dart';

class LedgerTransaction {
  int amount;
  DebitOrCredit debitOrCredit;
  Transaction transaction;
  LedgerTransaction({
    required this.amount,
    required this.debitOrCredit,
    required this.transaction,
  });
}
