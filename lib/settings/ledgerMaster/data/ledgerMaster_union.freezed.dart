// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'ledgerMaster_union.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LedgerMasterUnionTearOff {
  const _$LedgerMasterUnionTearOff();

  _LedgerMasterUnion call({required int index, required String name}) {
    return _LedgerMasterUnion(
      index: index,
      name: name,
    );
  }
}

/// @nodoc
const $LedgerMasterUnion = _$LedgerMasterUnionTearOff();

/// @nodoc
mixin _$LedgerMasterUnion {
  int get index => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LedgerMasterUnionCopyWith<LedgerMasterUnion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LedgerMasterUnionCopyWith<$Res> {
  factory $LedgerMasterUnionCopyWith(
          LedgerMasterUnion value, $Res Function(LedgerMasterUnion) then) =
      _$LedgerMasterUnionCopyWithImpl<$Res>;
  $Res call({int index, String name});
}

/// @nodoc
class _$LedgerMasterUnionCopyWithImpl<$Res>
    implements $LedgerMasterUnionCopyWith<$Res> {
  _$LedgerMasterUnionCopyWithImpl(this._value, this._then);

  final LedgerMasterUnion _value;
  // ignore: unused_field
  final $Res Function(LedgerMasterUnion) _then;

  @override
  $Res call({
    Object? index = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$LedgerMasterUnionCopyWith<$Res>
    implements $LedgerMasterUnionCopyWith<$Res> {
  factory _$LedgerMasterUnionCopyWith(
          _LedgerMasterUnion value, $Res Function(_LedgerMasterUnion) then) =
      __$LedgerMasterUnionCopyWithImpl<$Res>;
  @override
  $Res call({int index, String name});
}

/// @nodoc
class __$LedgerMasterUnionCopyWithImpl<$Res>
    extends _$LedgerMasterUnionCopyWithImpl<$Res>
    implements _$LedgerMasterUnionCopyWith<$Res> {
  __$LedgerMasterUnionCopyWithImpl(
      _LedgerMasterUnion _value, $Res Function(_LedgerMasterUnion) _then)
      : super(_value, (v) => _then(v as _LedgerMasterUnion));

  @override
  _LedgerMasterUnion get _value => super._value as _LedgerMasterUnion;

  @override
  $Res call({
    Object? index = freezed,
    Object? name = freezed,
  }) {
    return _then(_LedgerMasterUnion(
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LedgerMasterUnion implements _LedgerMasterUnion {
  _$_LedgerMasterUnion({required this.index, required this.name});

  @override
  final int index;
  @override
  final String name;

  @override
  String toString() {
    return 'LedgerMasterUnion(index: $index, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LedgerMasterUnion &&
            (identical(other.index, index) ||
                const DeepCollectionEquality().equals(other.index, index)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(index) ^
      const DeepCollectionEquality().hash(name);

  @JsonKey(ignore: true)
  @override
  _$LedgerMasterUnionCopyWith<_LedgerMasterUnion> get copyWith =>
      __$LedgerMasterUnionCopyWithImpl<_LedgerMasterUnion>(this, _$identity);
}

abstract class _LedgerMasterUnion implements LedgerMasterUnion {
  factory _LedgerMasterUnion({required int index, required String name}) =
      _$_LedgerMasterUnion;

  @override
  int get index => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LedgerMasterUnionCopyWith<_LedgerMasterUnion> get copyWith =>
      throw _privateConstructorUsedError;
}
