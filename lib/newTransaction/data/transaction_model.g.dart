// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Transaction _$_$_TransactionFromJson(Map<String, dynamic> json) {
  return _$_Transaction(
    id: json['id'] as int?,
    debitAmount: json['debitAmount'] as int,
    creditAmount: json['creditAmount'] as int,
    partialPaymentAmount: json['partialPaymentAmount'] as int,
    particular: json['particular'] as String,
    mode: _$enumDecode(_$TransactionModeEnumMap, json['mode']),
    date: DateTime.fromMicrosecondsSinceEpoch((json['date']),
    transactionCategoryId: json['transactionCategoryId'] as int,
    partyLedgerId: json['partyLedgerId'] as int?,
    assetLedgerId: json['assetLedgerId'] as int?,
    debitSideLedger: json['debitSideLedger'] as int?,
    creditSideLedger: json['creditSideLedger'] as int?,
  );
}

Map<String, dynamic> _$_$_TransactionToJson(_$_Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'debitAmount': instance.debitAmount,
      'creditAmount': instance.creditAmount,
      'partialPaymentAmount': instance.partialPaymentAmount,
      'particular': instance.particular,
      'mode': _$TransactionModeEnumMap[instance.mode],
      'date': instance.date.microsecondsSinceEpoch(),
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
