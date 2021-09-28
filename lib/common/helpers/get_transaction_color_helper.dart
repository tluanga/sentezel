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
      return Palette.color4;

    case TransactionType.pekchhuah:
      return Palette.color5;

    case TransactionType.debtRepaymentByDebtor:
      return Palette.color6;

    case TransactionType.debtRepaymentToCreditor:
      return Palette.color7;
    case TransactionType.cashToBank:
      return Palette.color8;
    case TransactionType.bankToCash:
      return Palette.color8;
    case TransactionType.capitalInjection:
      return Palette.color9;
    default:
      return Palette.color10;
  }
}
