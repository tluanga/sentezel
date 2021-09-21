import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sentezel/common/enums/transaction_type_enum.dart';
import 'package:sentezel/common/ui/pallete.dart';

Color getTransactionColor(TransactionType type) {
  switch (type) {
    case TransactionType.lei:
      return Palette.color1;
    case TransactionType.purchaseReturn:
      return Palette.color2;
    case TransactionType.hralh:
      return Palette.color3;
    case TransactionType.saleReturn:
      return Palette.color4;
    case TransactionType.lakluh:
      return Palette.color1;
      ;
    case TransactionType.pekchhuah:
      return Palette.color2;

    case TransactionType.debtRepaymentByDebtor:
      return Palette.color3;

    case TransactionType.debtRepaymentToCreditor:
      return Palette.color4;
    case TransactionType.cashToBank:
      return Palette.color1;
      ;
    case TransactionType.bankToCash:
      return Palette.color2;
    case TransactionType.capitalInjection:
      return Palette.color1;
    default:
      return Palette.color2;
      ;
  }
}
