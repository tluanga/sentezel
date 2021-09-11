import 'package:sentezel/settings/ledgerMaster/data/ledgerMaster_model.dart';

class Expense {
  int totalAmount;
  LedgerMaster ledgerName;
  Expense({
    required this.totalAmount,
    required this.ledgerName,
  });
}

class Income {
  int totalAmount;
  LedgerMaster ledgerName;
  Income({
    required this.totalAmount,
    required this.ledgerName,
  });
}
