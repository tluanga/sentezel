import 'package:enum_to_string/enum_to_string.dart';
import 'package:sentezel/common/enums/activeInActive_enum.dart';
import 'package:sentezel/common/enums/sumChetvelDanType_enum.dart';

class TransactionType {
  int id = 0;
  String name;
  String description;
  SumChetvelDanType sumChetVelDanType; // 0--for buy 1-- sell
  int debitSideLedger;
  int creditSideLedger;
  ActiveInActive? status = ActiveInActive.active;

  // 0 - when Incomplete and 1- when Complete

  TransactionType({
    required this.name,
    required this.description,
    required this.sumChetVelDanType,
    required this.debitSideLedger,
    required this.creditSideLedger,
  });
  TransactionType.widthId({
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
    map['active'] = EnumToString.convertToString(status);

    return map;
  }

  factory TransactionType.fromMap(Map<String, dynamic> map) {
    SumChetvelDanType _sumChetVelDanType;
    switch (map['_sumChetVelDanType']) {
      case 'lei':
        _sumChetVelDanType = SumChetvelDanType.lei;
        break;
      case 'hralh':
        _sumChetVelDanType = SumChetvelDanType.hralh;
        break;
      case 'lakluh':
        _sumChetVelDanType = SumChetvelDanType.lakluh;
        break;
      case 'pekchhuah':
        _sumChetVelDanType = SumChetvelDanType.pekchhuah;
        break;
      case 'debtRepaymentByDebtor':
        _sumChetVelDanType = SumChetvelDanType.debtRepaymentByDebtor;
        break;
      case 'debtRepaymentByCreditor':
        _sumChetVelDanType = SumChetvelDanType.debtRepaymentToCreditor;
        break;
      case 'bankToCash':
        _sumChetVelDanType = SumChetvelDanType.bankToCash;
        break;
      case 'cashToBank':
        _sumChetVelDanType = SumChetvelDanType.cashToBank;
        break;
      case 'purchaseReturn':
        _sumChetVelDanType = SumChetvelDanType.purchaseReturn;
        break;
      case 'saleReturn':
        _sumChetVelDanType = SumChetvelDanType.saleReturn;
        break;
      case 'capitalInjection':
        _sumChetVelDanType = SumChetvelDanType.capitalInjection;
        break;
      case 'openingBalanceCash':
        _sumChetVelDanType = SumChetvelDanType.openingBalanceCash;
        break;
      default:
        _sumChetVelDanType = SumChetvelDanType.openingBalanceBank;
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

    return TransactionType.widthId(
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
