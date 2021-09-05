import 'package:sentezel/common/enums/debitOrCredit_enum.dart';

class TransactionElement {
  int ledgerId;
  int amount;
  TransactionElement({
    required this.ledgerId,
    required this.amount,
  });
}
