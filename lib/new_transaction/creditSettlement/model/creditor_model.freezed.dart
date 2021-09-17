// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'creditor_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CreditorTearOff {
  const _$CreditorTearOff();

  _Creditor call({int amount = 0, LedgerMaster? party}) {
    return _Creditor(
      amount: amount,
      party: party,
    );
  }
}

/// @nodoc
const $Creditor = _$CreditorTearOff();

/// @nodoc
mixin _$Creditor {
  int get amount => throw _privateConstructorUsedError;
  LedgerMaster? get party => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreditorCopyWith<Creditor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreditorCopyWith<$Res> {
  factory $CreditorCopyWith(Creditor value, $Res Function(Creditor) then) =
      _$CreditorCopyWithImpl<$Res>;
  $Res call({int amount, LedgerMaster? party});
}

/// @nodoc
class _$CreditorCopyWithImpl<$Res> implements $CreditorCopyWith<$Res> {
  _$CreditorCopyWithImpl(this._value, this._then);

  final Creditor _value;
  // ignore: unused_field
  final $Res Function(Creditor) _then;

  @override
  $Res call({
    Object? amount = freezed,
    Object? party = freezed,
  }) {
    return _then(_value.copyWith(
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      party: party == freezed
          ? _value.party
          : party // ignore: cast_nullable_to_non_nullable
              as LedgerMaster?,
    ));
  }
}

/// @nodoc
abstract class _$CreditorCopyWith<$Res> implements $CreditorCopyWith<$Res> {
  factory _$CreditorCopyWith(_Creditor value, $Res Function(_Creditor) then) =
      __$CreditorCopyWithImpl<$Res>;
  @override
  $Res call({int amount, LedgerMaster? party});
}

/// @nodoc
class __$CreditorCopyWithImpl<$Res> extends _$CreditorCopyWithImpl<$Res>
    implements _$CreditorCopyWith<$Res> {
  __$CreditorCopyWithImpl(_Creditor _value, $Res Function(_Creditor) _then)
      : super(_value, (v) => _then(v as _Creditor));

  @override
  _Creditor get _value => super._value as _Creditor;

  @override
  $Res call({
    Object? amount = freezed,
    Object? party = freezed,
  }) {
    return _then(_Creditor(
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      party: party == freezed
          ? _value.party
          : party // ignore: cast_nullable_to_non_nullable
              as LedgerMaster?,
    ));
  }
}

/// @nodoc

class _$_Creditor implements _Creditor {
  _$_Creditor({this.amount = 0, this.party});

  @JsonKey(defaultValue: 0)
  @override
  final int amount;
  @override
  final LedgerMaster? party;

  @override
  String toString() {
    return 'Creditor(amount: $amount, party: $party)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Creditor &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.party, party) ||
                const DeepCollectionEquality().equals(other.party, party)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(party);

  @JsonKey(ignore: true)
  @override
  _$CreditorCopyWith<_Creditor> get copyWith =>
      __$CreditorCopyWithImpl<_Creditor>(this, _$identity);
}

abstract class _Creditor implements Creditor {
  factory _Creditor({int amount, LedgerMaster? party}) = _$_Creditor;

  @override
  int get amount => throw _privateConstructorUsedError;
  @override
  LedgerMaster? get party => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CreditorCopyWith<_Creditor> get copyWith =>
      throw _privateConstructorUsedError;
}
