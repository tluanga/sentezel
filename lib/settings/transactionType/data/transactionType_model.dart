import 'package:enum_to_string/enum_to_string.dart';
import 'package:sentezel/common/enums/activeInActive_enum.dart';
import 'package:sentezel/common/enums/sumChetvelDanType_enum.dart';

class TransactionCategory {
  int id = 0;
  String name;
  String description;
  TransactionType sumChetVelDanType; // 0--for buy 1-- sell
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
    required this.sumChetVelDanType,
    required this.debitSideLedger,
    required this.creditSideLedger,
  });
  TransactionCategory.withId({
    required this.id,
    required this.name,
    required this.description,
    required this.sumChetVelDanType,
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
    map['sumChetVelDanType'] = EnumToString.convertToString(sumChetVelDanType);
    map['debitSideLedger'] = debitSideLedger;
    map['creditSideLedger'] = creditSideLedger;
    map['status'] = EnumToString.convertToString(status);

    return map;
  }

  factory TransactionCategory.fromMap(Map<String, dynamic> map) {
    TransactionType _sumChetVelDanType;
    switch (map['_sumChetVelDanType']) {
      case 'lei':
        _sumChetVelDanType = TransactionType.lei;
        break;
      case 'hralh':
        _sumChetVelDanType = TransactionType.hralh;
        break;
      case 'lakluh':
        _sumChetVelDanType = TransactionType.lakluh;
        break;
      case 'pekchhuah':
        _sumChetVelDanType = TransactionType.pekchhuah;
        break;
      case 'debtRepaymentByDebtor':
        _sumChetVelDanType = TransactionType.debtRepaymentByDebtor;
        break;
      case 'debtRepaymentByCreditor':
        _sumChetVelDanType = TransactionType.debtRepaymentToCreditor;
        break;
      case 'bankToCash':
        _sumChetVelDanType = TransactionType.bankToCash;
        break;
      case 'cashToBank':
        _sumChetVelDanType = TransactionType.cashToBank;
        break;
      case 'purchaseReturn':
        _sumChetVelDanType = TransactionType.purchaseReturn;
        break;
      case 'saleReturn':
        _sumChetVelDanType = TransactionType.saleReturn;
        break;
      case 'capitalInjection':
        _sumChetVelDanType = TransactionType.capitalInjection;
        break;
      case 'openingBalanceCash':
        _sumChetVelDanType = TransactionType.openingBalanceCash;
        break;
      default:
        _sumChetVelDanType = TransactionType.openingBalanceBank;
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
      sumChetVelDanType: _sumChetVelDanType,
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
