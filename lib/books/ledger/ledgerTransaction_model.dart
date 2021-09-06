import 'package:sentezel/common/enums/debitOrCredit_enum.dart';

class LedgerTransaction {
  String particular;
  int amount;
  DebitOrCredit debitOrCredit;
  DateTime date;
  LedgerTransaction({
    required this.particular,
    required this.amount,
    required this.debitOrCredit,
    required this.date,
  });
}
