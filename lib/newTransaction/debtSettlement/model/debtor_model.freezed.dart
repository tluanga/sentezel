// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'debtor_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DebtorTearOff {
  const _$DebtorTearOff();

  _Debtor call({int amount = 0, LedgerMaster? party}) {
    return _Debtor(
      amount: amount,
      party: party,
    );
  }
}

/// @nodoc
const $Debtor = _$DebtorTearOff();

/// @nodoc
mixin _$Debtor {
  int get amount => throw _privateConstructorUsedError;
  LedgerMaster? get party => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DebtorCopyWith<Debtor> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DebtorCopyWith<$Res> {
  factory $DebtorCopyWith(Debtor value, $Res Function(Debtor) then) =
      _$DebtorCopyWithImpl<$Res>;
  $Res call({int amount, LedgerMaster? party});
}

/// @nodoc
class _$DebtorCopyWithImpl<$Res> implements $DebtorCopyWith<$Res> {
  _$DebtorCopyWithImpl(this._value, this._then);

  final Debtor _value;
  // ignore: unused_field
  final $Res Function(Debtor) _then;

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
abstract class _$DebtorCopyWith<$Res> implements $DebtorCopyWith<$Res> {
  factory _$DebtorCopyWith(_Debtor value, $Res Function(_Debtor) then) =
      __$DebtorCopyWithImpl<$Res>;
  @override
  $Res call({int amount, LedgerMaster? party});
}

/// @nodoc
class __$DebtorCopyWithImpl<$Res> extends _$DebtorCopyWithImpl<$Res>
    implements _$DebtorCopyWith<$Res> {
  __$DebtorCopyWithImpl(_Debtor _value, $Res Function(_Debtor) _then)
      : super(_value, (v) => _then(v as _Debtor));

  @override
  _Debtor get _value => super._value as _Debtor;

  @override
  $Res call({
    Object? amount = freezed,
    Object? party = freezed,
  }) {
    return _then(_Debtor(
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

class _$_Debtor implements _Debtor {
  _$_Debtor({this.amount = 0, this.party});

  @JsonKey(defaultValue: 0)
  @override
  final int amount;
  @override
  final LedgerMaster? party;

  @override
  String toString() {
    return 'Debtor(amount: $amount, party: $party)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Debtor &&
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
  _$DebtorCopyWith<_Debtor> get copyWith =>
      __$DebtorCopyWithImpl<_Debtor>(this, _$identity);
}

abstract class _Debtor implements Debtor {
  factory _Debtor({int amount, LedgerMaster? party}) = _$_Debtor;

  @override
  int get amount => throw _privateConstructorUsedError;
  @override
  LedgerMaster? get party => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DebtorCopyWith<_Debtor> get copyWith => throw _privateConstructorUsedError;
}
