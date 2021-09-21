import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sentezel/common/enums/transaction_type_enum.dart';

IconData getTransactionIcon(TransactionType type) {
  switch (type) {
    case TransactionType.lei:
      return CupertinoIcons.cube_box;
    case TransactionType.purchaseReturn:
      return CupertinoIcons.selection_pin_in_out;
    case TransactionType.hralh:
      return CupertinoIcons.dot_square;
    case TransactionType.saleReturn:
      return CupertinoIcons.hurricane;
    case TransactionType.lakluh:
      return CupertinoIcons.list_bullet_below_rectangle;
    case TransactionType.pekchhuah:
      return CupertinoIcons.square_arrow_down_on_square;

    case TransactionType.debtRepaymentByDebtor:
      return CupertinoIcons.list_bullet_below_rectangle;

    case TransactionType.debtRepaymentToCreditor:
      return CupertinoIcons.square_stack;
    case TransactionType.cashToBank:
      return CupertinoIcons.square_line_vertical_square_fill;
    case TransactionType.bankToCash:
      return CupertinoIcons.square_line_vertical_square_fill;
    case TransactionType.capitalInjection:
      return CupertinoIcons.square_stack_3d_down_dottedline;
    default:
      return CupertinoIcons.list_bullet_below_rectangle;
  }
}
