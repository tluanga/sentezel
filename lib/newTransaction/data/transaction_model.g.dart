// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Transaction _$_$_TransactionFromJson(Map<String, dynamic> json) {
  return _$_Transaction(
    json['id'] as int?,
    json['amount'] as int,
    json['debitAmount'] as int,
    json['creditAmount'] as int,
    json['particular'] as String,
    _$enumDecode(_$TransactionModeEnumMap, json['mode']),
    DateTime.parse(json['date'] as String),
    json['transactionCategoryId'] as int,
    json['partyLedgerId'] as int?,
    json['assetLedgerId'] as int?,
    json['debitSideLedger'] as int?,
    json['creditSideLedger'] as int?,
  );
}

Map<String, dynamic> _$_$_TransactionToJson(_$_Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'debitAmount': instance.debitAmount,
      'creditAmount': instance.creditAmount,
      'particular': instance.particular,
      'mode': _$TransactionModeEnumMap[instance.mode],
      'date': instance.date.toIso8601String(),
      'transactionCategoryId': instance.transactionCategoryId,
      'partyLedgerId': instance.partyLedgerId,
      'assetLedgerId': instance.assetLedgerId,
      'debitSideLedger': instance.debitSideLedger,
      'creditSideLedger': instance.creditSideLedger,
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

const _$TransactionModeEnumMap = {
  TransactionMode.credit: 'credit',
  TransactionMode.paymentByCash: 'paymentByCash',
  TransactionMode.paymentByBank: 'paymentByBank',
  TransactionMode.partialPaymentByCash: 'partialPaymentByCash',
  TransactionMode.partialPaymentByBank: 'partialPaymentByBank',
  TransactionMode.contra: 'contra',
};
