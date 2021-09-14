// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactionCategory_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionCategory _$_$_TransactionCategoryFromJson(
    Map<String, dynamic> json) {
  return _$_TransactionCategory(
    id: json['id'] as int?,
    name: json['name'] as String,
    description: json['description'] as String,
    transactionType:
        _$enumDecode(_$TransactionTypeEnumMap, json['transactionType']),
    debitSideLedger: json['debitSideLedger'] as int?,
    creditSideLedger: json['creditSideLedger'] as int?,
    status:
        _$enumDecodeNullable(_$StatusEnumMap, json['status']) ?? Status.active,
  );
}

Map<String, dynamic> _$_$_TransactionCategoryToJson(
        _$_TransactionCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'transactionType': _$TransactionTypeEnumMap[instance.transactionType],
      'debitSideLedger': instance.debitSideLedger,
      'creditSideLedger': instance.creditSideLedger,
      'status': _$StatusEnumMap[instance.status],
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$TransactionTypeEnumMap = {
  TransactionType.lei: 'lei',
  TransactionType.hralh: 'hralh',
  TransactionType.lakluh: 'lakluh',
  TransactionType.pekchhuah: 'pekchhuah',
  TransactionType.debtRepaymentByDebtor: 'debtRepaymentByDebtor',
  TransactionType.debtRepaymentToCreditor: 'debtRepaymentToCreditor',
  TransactionType.bankToCash: 'bankToCash',
  TransactionType.cashToBank: 'cashToBank',
  TransactionType.purchaseReturn: 'purchaseReturn',
  TransactionType.saleReturn: 'saleReturn',
  TransactionType.capitalInjection: 'capitalInjection',
  TransactionType.openingBalanceCash: 'openingBalanceCash',
  TransactionType.openingBalanceBank: 'openingBalanceBank',
};

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$StatusEnumMap = {
  Status.active: 'active',
  Status.inActive: 'inActive',
};
