// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Asset _$_$_AssetFromJson(Map<String, dynamic> json) {
  return _$_Asset(
    id: json['id'] as String?,
    name: json['name'] as String,
    description: json['description'] as String,
    status: _$enumDecodeNullable(_$ActiveInActiveEnumMap, json['status']) ??
        ActiveInActive.active,
  );
}

Map<String, dynamic> _$_$_AssetToJson(_$_Asset instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'status': _$ActiveInActiveEnumMap[instance.status],
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

const _$ActiveInActiveEnumMap = {
  ActiveInActive.active: 'active',
  ActiveInActive.inActive: 'inActive',
};
