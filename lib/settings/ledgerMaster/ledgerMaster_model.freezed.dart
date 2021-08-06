// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'ledgerMaster_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LedgerMasterTearOff {
  const _$LedgerMasterTearOff();

  _LedgerMaster call(
      {String? id,
      required String name,
      String? description,
      required LedgerMasterType type,
      ActiveInActive status = ActiveInActive.active}) {
    return _LedgerMaster(
      id: id,
      name: name,
      description: description,
      type: type,
      status: status,
    );
  }
}

/// @nodoc
const $LedgerMaster = _$LedgerMasterTearOff();

/// @nodoc
mixin _$LedgerMaster {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  LedgerMasterType get type => throw _privateConstructorUsedError;
  ActiveInActive get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LedgerMasterCopyWith<LedgerMaster> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LedgerMasterCopyWith<$Res> {
  factory $LedgerMasterCopyWith(
          LedgerMaster value, $Res Function(LedgerMaster) then) =
      _$LedgerMasterCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String name,
      String? description,
      LedgerMasterType type,
      ActiveInActive status});
}

/// @nodoc
class _$LedgerMasterCopyWithImpl<$Res> implements $LedgerMasterCopyWith<$Res> {
  _$LedgerMasterCopyWithImpl(this._value, this._then);

  final LedgerMaster _value;
  // ignore: unused_field
  final $Res Function(LedgerMaster) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? type = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as LedgerMasterType,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ActiveInActive,
    ));
  }
}

/// @nodoc
abstract class _$LedgerMasterCopyWith<$Res>
    implements $LedgerMasterCopyWith<$Res> {
  factory _$LedgerMasterCopyWith(
          _LedgerMaster value, $Res Function(_LedgerMaster) then) =
      __$LedgerMasterCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String name,
      String? description,
      LedgerMasterType type,
      ActiveInActive status});
}

/// @nodoc
class __$LedgerMasterCopyWithImpl<$Res> extends _$LedgerMasterCopyWithImpl<$Res>
    implements _$LedgerMasterCopyWith<$Res> {
  __$LedgerMasterCopyWithImpl(
      _LedgerMaster _value, $Res Function(_LedgerMaster) _then)
      : super(_value, (v) => _then(v as _LedgerMaster));

  @override
  _LedgerMaster get _value => super._value as _LedgerMaster;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? type = freezed,
    Object? status = freezed,
  }) {
    return _then(_LedgerMaster(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as LedgerMasterType,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ActiveInActive,
    ));
  }
}

/// @nodoc

class _$_LedgerMaster extends _LedgerMaster {
  const _$_LedgerMaster(
      {this.id,
      required this.name,
      this.description,
      required this.type,
      this.status = ActiveInActive.active})
      : super._();

  @override
  final String? id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final LedgerMasterType type;
  @JsonKey(defaultValue: ActiveInActive.active)
  @override
  final ActiveInActive status;

  @override
  String toString() {
    return 'LedgerMaster(id: $id, name: $name, description: $description, type: $type, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LedgerMaster &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(status);

  @JsonKey(ignore: true)
  @override
  _$LedgerMasterCopyWith<_LedgerMaster> get copyWith =>
      __$LedgerMasterCopyWithImpl<_LedgerMaster>(this, _$identity);
}

abstract class _LedgerMaster extends LedgerMaster {
  const factory _LedgerMaster(
      {String? id,
      required String name,
      String? description,
      required LedgerMasterType type,
      ActiveInActive status}) = _$_LedgerMaster;
  const _LedgerMaster._() : super._();

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String? get description => throw _privateConstructorUsedError;
  @override
  LedgerMasterType get type => throw _privateConstructorUsedError;
  @override
  ActiveInActive get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LedgerMasterCopyWith<_LedgerMaster> get copyWith =>
      throw _privateConstructorUsedError;
}
