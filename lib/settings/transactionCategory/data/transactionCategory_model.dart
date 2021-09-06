import 'package:enum_to_string/enum_to_string.dart';
import 'package:sentezel/common/enums/activeInActive_enum.dart';
import 'package:sentezel/common/enums/sumChetvelDanType_enum.dart';

class TransactionCategory {
  int id = 0;
  String name;
  String description;
  TransactionType transactionType; // 0--for buy 1-- sell
  int debitSideLedger;
  int creditSideLedger;

  ActiveInActive? status = ActiveInActive.active;

  String getInitialLetter() {
    return this.name[0].toUpperCase();
  }

  // 0 - when Incomplete and 1- when Complete

  TransactionCategory({
    required this.name,
    required this.description,
    required this.transactionType,
    required this.debitSideLedger,
    required this.creditSideLedger,
  });
  TransactionCategory.withId({
    required this.id,
    required this.name,
    required this.description,
    required this.transactionType,
    required this.debitSideLedger,
    required this.creditSideLedger,
    this.status = ActiveInActive.active,
  });

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();

    if (id != 0) {
      map['id'] = id;
    }
    map['name'] = name;
    map['description'] = description;
    map['transactionType'] = EnumToString.convertToString(transactionType);
    map['debitSideLedger'] = debitSideLedger;
    map['creditSideLedger'] = creditSideLedger;
    map['status'] = EnumToString.convertToString(status);

    return map;
  }

  factory TransactionCategory.fromMap(Map<String, dynamic> map) {
    TransactionType _transactionType;
    switch (map['_transactionType']) {
      case 'lei':
        _transactionType = TransactionType.lei;
        break;
      case 'hralh':
        _transactionType = TransactionType.hralh;
        break;
      case 'lakluh':
        _transactionType = TransactionType.lakluh;
        break;
      case 'pekchhuah':
        _transactionType = TransactionType.pekchhuah;
        break;
      case 'debtRepaymentByDebtor':
        _transactionType = TransactionType.debtRepaymentByDebtor;
        break;
      case 'debtRepaymentByCreditor':
        _transactionType = TransactionType.debtRepaymentToCreditor;
        break;
      case 'bankToCash':
        _transactionType = TransactionType.bankToCash;
        break;
      case 'cashToBank':
        _transactionType = TransactionType.cashToBank;
        break;
      case 'purchaseReturn':
        _transactionType = TransactionType.purchaseReturn;
        break;
      case 'saleReturn':
        _transactionType = TransactionType.saleReturn;
        break;
      case 'capitalInjection':
        _transactionType = TransactionType.capitalInjection;
        break;
      case 'openingBalanceCash':
        _transactionType = TransactionType.openingBalanceCash;
        break;
      default:
        _transactionType = TransactionType.openingBalanceBank;
        break;
    }
    ActiveInActive _status;
    switch (map['status']) {
      case 'active':
        _status = ActiveInActive.active;
        break;
      default:
        _status = ActiveInActive.inActive;
    }

    return TransactionCategory.withId(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      transactionType: _transactionType,
      debitSideLedger: map['debitSideLedger'],
      creditSideLedger: map['creditSideLedger'],
      status: _status,
    );
  }
}

class LedgerList {
  int? id;
  String name;
  LedgerList({
    // this.id,
    required this.name,
  });
  LedgerList.withId({
    this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['name'] = name;
    return map;
  }

  factory LedgerList.fromMap(Map<String, dynamic> map) {
    return LedgerList.withId(
      id: map['id'],
      name: map['name'],
    );
  }
}
